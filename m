Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB715E63B
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 16:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbfGCOPh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 10:15:37 -0400
Received: from ns.iliad.fr ([212.27.33.1]:54618 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbfGCOPh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jul 2019 10:15:37 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id DDF88201DB;
        Wed,  3 Jul 2019 16:15:35 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id C5B9620119;
        Wed,  3 Jul 2019 16:15:35 +0200 (CEST)
Subject: Re: [PATCH v1] media: si2168: Refactor command setup code
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brad Love <brad@nextdimension.cc>
References: <6a8f9a5b-2e88-8c26-440b-76af0d91eda6@free.fr>
 <20190702095109.GC22408@latitude>
 <6a644c94-f979-b656-472b-c7fe9303e08c@free.fr>
Message-ID: <68ae0fde-ce8b-968d-853f-86eb5b1247aa@free.fr>
Date:   Wed, 3 Jul 2019 16:15:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6a644c94-f979-b656-472b-c7fe9303e08c@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jul  3 16:15:35 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/07/2019 14:47, Marc Gonzalez wrote:

> Come to think of it, I'm really not a fan of "large" macro functions.
> I'll outline a different option in v2.

My idea is to use a trivial helper function to assign the 3 struct fields,
and then a trivial macro to invoke the helper:

static void cmd_setup(struct si2168_cmd *cmd, char *args, int wlen, int rlen)
{
	memcpy(cmd->args, args, wlen);
	cmd->wlen = wlen;
	cmd->rlen = rlen;
}

#define CMD_SETUP(cmd, args, rlen) \
	cmd_setup(cmd, args, sizeof(args) - 1, rlen)


I think this way addresses all of your comments:

- since we're using a real function, the compiler can perform type-checking,
and the function's prototype is self-documenting.
- no more funky __args and __rlen arguments
- no local variables


Note however, that drivers/media/tuners/si2157.c uses a different struct
(struct si2157_cmd). Therefore, if we wanted to apply the same changes
to si2157.c, we would have to define a common struct, and replace all
the uses of struct si2157_cmd and struct si2168_cmd. That seemed too
invasive to do without the maintainer's approval and guidance.

Antti, do you Ack this new approach?

It's not clear what HW is supported by drivers/media/dvb-frontends/si21xx.c
(that's a very generic name).

Regards.
