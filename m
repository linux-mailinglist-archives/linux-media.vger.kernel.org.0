Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCE7759DD5
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 16:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbfF1OeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 10:34:25 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:41141 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726686AbfF1OeZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 10:34:25 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id grxEhmqffSfvXgrxHhSMWF; Fri, 28 Jun 2019 16:34:24 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC] Stateful codecs and requirements for compressed formats
Message-ID: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
Date:   Fri, 28 Jun 2019 16:34:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfG+qm6FF17tXOdHbyKLrWXmplbfW3+jC+npMxXV/ZhfQzn7U1ReuyKuVuaCXw9t5ERtpkJfoAE4E2YK1q8iJXAYTLI9xgQ8+4e7iR0sSfbxyM0iPZim3
 T7Afnk57+2/im+ubg1DnVdchpjfbu2SLIihc54PI5QPi26fau3fT7+bqGgRlOKTgtT4lHLYswWcC8tVbr2fdC5m2BcHp6i3j7fxVIeYlogokp8nNx2RzQl0C
 GNgVQNvCUPHSkihj1A6sZ3VBLgb62GbW9JV558M10S5656wRryxV8ztyLlRLhOgjt0yMQpzMvUL5RJAeWmrUm/nVyLIdd8SR66D2yhcubim609/SQKpoGAIn
 0LNkwMR+BbsnK7XHjxYnDa2Vl/2Ze5NyMekmPflUmzuWGjKFiJYx/WBXH5EMd3JdKOH82lj0sxw0Qsc2hJ5+JZMahwLnaOvWXU+ZOMF6fcll1MtyLUfZ8j86
 +tGXCHaBGyttYo7THzNm4dPCx7Ms1kSyUwilUCT6gytMzkgky1QZN1DbgY0s8UsHGf29NiUsQXNeSqUi
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I hope I Cc-ed everyone with a stake in this issue.

One recurring question is how a stateful encoder fills buffers and how a stateful
decoder consumes buffers.

The most generic case is that an encoder produces a bitstream and just fills each
CAPTURE buffer to the brim before continuing with the next buffer.

I don't think there are drivers that do this, I believe that all drivers just
output a single compressed frame. For interlaced formats I understand it is either
one compressed field per buffer, or two compressed fields per buffer (this is
what I heard, I don't know if this is true).

In any case, I don't think this is specified anywhere. Please correct me if I am
wrong.

The latest stateful codec spec is here:

https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html

Assuming what I described above is indeed the case, then I think this should
be documented. I don't know enough if a flag is needed somewhere to describe
the behavior for interlaced formats, or can we leave this open and have userspace
detect this?


For decoders it is more complicated. The stateful decoder spec is written with
the assumption that userspace can just fill each OUTPUT buffer to the brim with
the compressed bitstream. I.e., no need to split at frame or other boundaries.

See section 4.5.1.7 in the spec.

But I understand that various HW decoders *do* have limitations. I would really
like to know about those, since that needs to be exposed to userspace somehow.

Specifically, the venus decoder needs to know the resolution of the coded video
beforehand and it expects a single frame per buffer (how does that work for
interlaced formats?).

Such requirements mean that some userspace parsing is still required, so these
decoders are not completely stateful.

Can every codec author give information about their decoder/encoder?

I'll start off with my virtual codec driver:

vicodec: the decoder fully parses the bitstream. The encoder produces a single
compressed frame per buffer. This driver doesn't yet support interlaced formats,
but when that is added it will encode one field per buffer.

Let's see what the results are.

Regards,

	Hans
