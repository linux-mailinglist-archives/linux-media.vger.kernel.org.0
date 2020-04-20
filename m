Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C451B0ED9
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 16:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgDTOst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 10:48:49 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:50573 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726102AbgDTOss (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 10:48:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QXj1j1xNI7xncQXj4jHnf2; Mon, 20 Apr 2020 16:48:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587394127; bh=TyRu+hmzNEzaN+li0ZpFdTT7S98oYprI8p1JrWaOHwc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jEfekwj2ZexB0LxuiEinDrTzr+L7tfN7x0yXLagY2AtBKbFUWkoilO6E8pbvWPE8I
         6EvnMztqXvmymRwqfefb9ql/E3k3yUMTv+TjQGvADa06nWs5Gdogn1ydGVyDYXyazK
         Wqek0kqcVURvT03urrT90D7TCgfgzD+pZBJnbG33gsv/IqtHVyBjoI2LXbpWIH71dV
         xaihzxRzbktwdIc8D4D3oLs7MeC7K2WmEkSDC2RM5iafz8KAmFvmqB9oSuMj2ZcKnL
         M+wfI4FgRIFmyZfdzhoxelTUOhx7uzE2Ts9raj3N7nN7GIWALbsWBw+/qnkEA3fXwS
         EnTy8Srp4XbpQ==
Subject: Re: decode sync frames only
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
References: <9a58a501-8348-2230-2ab5-534471d866ca@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b4471541-aeaf-462b-ee36-14ac4e2845f8@xs4all.nl>
Date:   Mon, 20 Apr 2020 16:48:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9a58a501-8348-2230-2ab5-534471d866ca@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBndLQkakqnXUNncz12NCqvmu9/bkVMUU1G1jyF9Zag7QxMvrckiocIweSbefWSfHMPlmi3k163tl6FW9QVal47Da0FseJHEKU+A3alL5Lsze8Rnmp+t
 JZ5/OG2omhYecUoLSaU6ey4yTAc/WXP+RyCeCvnWrPtjAnu9UBW2p0RxRZ8nCJH5xBhM8WgEUPkRTTUYhfmsj9wrTZWUtGaecq7kwo9JlaFwzIlSdtA+egs8
 synosGyj1Zt3ZeU82Y+lUg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2020 16:38, Stanimir Varbanov wrote:
> Hi,
> 
> I need to port a decoder v4l2 control in mainline Venus driver which
> instructs the decoder to decode sync frames only (I frame/ IDR frame).
> In practice the usage of such control is to generate thumbnails for
> particular video.
> 
> To do that I researched what we have currently in v4l2-controls.h and
> found something similar but for encoders:
> 
> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME
> "Force a key frame for the next queued buffer. Applicable to encoders.
> This is a general, codec-agnostic keyframe control."
> 
> I think I have two options:
> 
> 1. reuse V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME for the decoder and document it
> 
> 2. create a new v4l control V4L2_CID_MPEG_VIDC_VIDEO_SYNC_FRAME_DECODE

Make a new v4l control. The encoder control is for something quite different.

How about V4L2_CID_MPEG_VIDEO_DEC_KEY_FRAMES_ONLY?

Regards,

	Hans
