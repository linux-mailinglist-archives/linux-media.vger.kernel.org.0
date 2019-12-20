Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95E31127F5C
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 16:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfLTPck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 10:32:40 -0500
Received: from mail.kapsi.fi ([91.232.154.25]:53185 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727181AbfLTPck (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 10:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=bbHpYegLNeMLSDVfbHhUyqcNmgFyHKRFq9zdNHisJX0=; b=v/Q5/ulJTz+O4sf6se28s9xMv2
        c6N13HqGiOebnqyo75PMpucHykzdmQoCc5Gt4snzrj3k+ZOeOgq5UAEgEt7E3O0nYMSrbUkSYdRWz
        DpZlqO7/DaOvdI7EE2pJoKM871XvV9V3KPwiTdM8LQTPUmvMIQxE4XTB28l1zGjkvIIrdFbYUsiEY
        pvfgmOdQONTZdUU/F5EW7STYSR4uGTtGwFsk38I45vnNxlNLIGX4cP3B8X2dNI/qDhmGUbFoCgML8
        x/OgDgjhTCUZhLKEIYbCy1JxLG6qfnF7LAbrh/wsVTrTYPCsXMtTJfsY78jCqNCJiwIG+I721gNsY
        fkq8UXLA==;
Received: from dvbz8cyyyyyyyyyyyy2wt-3.rev.dnainternet.fi ([2001:14ba:8869:c100::5a5] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1iiKGa-00037F-H8; Fri, 20 Dec 2019 17:32:36 +0200
Subject: Re: [PATCH v3 04/14] si2157: Add analog tuning related functions
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20191114200408.28883-1-brad@nextdimension.cc>
 <20191114200408.28883-5-brad@nextdimension.cc>
 <f2375be1-5bb2-ef59-ecd9-a3a8f6081b99@iki.fi>
 <20191219141300.3ffbdb1e@kernel.org>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <97a0d12e-7483-3b28-c4ba-4956053dd4b9@iki.fi>
Date:   Fri, 20 Dec 2019 17:32:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219141300.3ffbdb1e@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:14ba:8869:c100::5a5
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/19/19 3:13 PM, Mauro Carvalho Chehab wrote:
> Em Sun, 24 Nov 2019 07:09:07 +0200
> Antti Palosaari <crope@iki.fi> escreveu:
> 
>> On 11/14/19 10:03 PM, Brad Love wrote:
>>> Include set_analog_params, get_frequency, and get_bandwidth.
>>>
>>> Tested with NTSC and PAL standards via ch3/4 generator. Other standards
>>> are included, but are untested due to lack of generator.
>>>
>>> Signed-off-by: Brad Love <brad@nextdimension.cc>
>>> ---
>>> Changes since v1:
>>> - remove __func__ from dev_dbg macros
>>
>> After all it looks pretty simply, but implementation is not done that
>> simply. Crazy RF/IF offsets, impossible values and so.
>>
>> I think you need to study some tuner basics:
>> * what IF frequency is, why, and so
>> * IF vs. BW, what is relation, what are possible values
>> * Down conversion RF to IF. OK, *on that case* firmware covers PLL, but
>> it is fundamental. So basics of integer-N and fractional-N PLL is always
>> you must to know.
>> * Filtering. Especially IF filtering, which is generally low-pass
>> filtering. Think possible filters when selecting IF.
> 
> For me, the implementation seems to make sense. I mean, for analog TV, both
> channel bandwidth and chroma/audio sub-carrier IF depends on the TV standard
> only.
> 
> So, for NTSC and PAL/M/N/N', bandwidth is always 6MHz. For other standards, it
> may be either 6MHz, 7MHz or 8MHz. the actual bandwidth depends if it is
> a channel at VHF or at UHF range.
> 
> So, this part of the patch sounds OK to me.
> 
> The IF is actually a little trickier. Yet, if you take a lok on other
> tuners, like drivers/media/tuners/tda827x.c, it is up tot he tuner to
> automatically set the IF that will work for each video standard:
> 
> static void tda827x_set_std(struct dvb_frontend *fe,
> 			    struct analog_parameters *params)
> {
> 	struct tda827x_priv *priv = fe->tuner_priv;
> 	char *mode;
> 
> 	priv->lpsel = 0;
> 	if (params->std & V4L2_STD_MN) {
> 		priv->sgIF = 92;
> 		priv->lpsel = 1;
> 		mode = "MN";
> 	} else if (params->std & V4L2_STD_B) {
> 		priv->sgIF = 108;
> 		mode = "B";
> ...
> 
> static int tda827xo_set_analog_params(struct dvb_frontend *fe,
> 				      struct analog_parameters *params)
> {
> 
> ...
> 
> 	N = freq + priv->sgIF;
> 
> In other words, for analog TV, the tuner will always receive the
> channel central frequency, with may vary depending on the video
> standard, and will adjust it to tune at the right channel, using the
> per-standard IF (if needed), as, on most tuner drivers, the tunning
> frequency should be either initial frequency or the main carrier
> frequency, and not the center frequency.

How the carrier central frequency can be vary tings like video standard?
If you tune to some channel like 654.321MHz then that is central 
frequency no matter what kind of bandwidth is used.

And as I pointed those strange offset, please tell me what is that 
1250000 Hz offset? It simply looks nonsense. You first add 1250000 to RF 
frequency, then you compensate same from IF value - the carrier at IF 
will be just same.

Also, there was something like 6/7/8MHz wide channel dropped to IF only 
1.25MHz. How that wide channel could fit that small space?

regards
Antti




-- 
http://palosaari.fi/
