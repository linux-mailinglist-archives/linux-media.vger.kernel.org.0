Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A186B3A1BC3
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 19:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhFIRaT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 13:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhFIRaT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 13:30:19 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925F6C061574
        for <linux-media@vger.kernel.org>; Wed,  9 Jun 2021 10:28:12 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id o3so7994418wri.8
        for <linux-media@vger.kernel.org>; Wed, 09 Jun 2021 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7+rBoL2O4UlV5pjg0rkpaWLZYflspD7RnTxSjqJDLA0=;
        b=LPL0G/OlXZv5dDzmpbZG3erbJ1c4eURW3jo3at1UJuzARQfn9Qc4QXrKw3J8uhEshz
         wp3USP5AEHRtOL4HEQQKWzjSaPuKzbUojvPSkueQJLFqI+C2Q+usfF59EcoJs/d8ZCis
         FVxmIMq14ZWOb22zILz8li6UlojLpNvDKtkeKm3tBq/TKJ4Rbh7uf0xKHNXaAIlji4FU
         v5RMEKDcxVGSgSZAZGXufy64l5ZvB4r7ny6UW/s610raLlSsWfrowVfFWKzsHZHRqlgq
         /5WJp1afrWnMBB+BmC8nH42l++wpcXHfufSMtsaqAkDgWme2ylX3EfqRtO7cm+5Psuq+
         XTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7+rBoL2O4UlV5pjg0rkpaWLZYflspD7RnTxSjqJDLA0=;
        b=T0LYyu9KQDSIfdvunq39EsG3ETJFkDrA8G7Aqx37yWRw656GoymoSLtTIVHCIYlfrf
         VSDWzvkIV61g4l6gkKNHdrTI6XQa6RHiicdp+wS85RATtMvtF63EhBbiRhODvcUP7+Es
         ShSyMkPzrD7Xo85Zdl9cg0lv9p7FMBweyk3tuDe5xBOuJWvPtWzmBIs4ey/Dsngryh+C
         La9DPCTeSbLtmi5X5CoC+LEpbKAbG96A6KYaa21pFHbMWiL6rwPULfFR4qB38/GDSsJw
         oei7rMCp5mBxZEJoWII7RoftwbSewyT8l+gEcexUvnosczMWUKphmffIUBnHjGI9E0Em
         MWpA==
X-Gm-Message-State: AOAM530N3BS+Q6rFmDjJdYQlMPKHHV2VP7QHw2jh8NTWftWe5LeEMLSQ
        KKBgt/W1fiG1aZS4PRBYamzv75aHW7w=
X-Google-Smtp-Source: ABdhPJzsgYWNq4Pj+ayKlmcv4NLpHqTupE3QVHvOGy5dqjwzIOy99QK+E5POe4AFmqbuDxlm941KWQ==
X-Received: by 2002:a5d:630f:: with SMTP id i15mr917119wru.155.1623259691145;
        Wed, 09 Jun 2021 10:28:11 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:1c07:9700:6acb:61b6:ae46:2431? ([2a00:23c4:1c07:9700:6acb:61b6:ae46:2431])
        by smtp.googlemail.com with ESMTPSA id x3sm6770623wmj.30.2021.06.09.10.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 10:28:10 -0700 (PDT)
Subject: Re: Unable to capture adv7280-m on i.MX6Q
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
 <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
 <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
 <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
 <CAOMZO5CxDtPa_WYEJf9dkLa8x1UthicBqB=RBJUgxKud+srsDQ@mail.gmail.com>
 <a6322fe86be905c028ede9ee2abee278266e1b35.camel@pengutronix.de>
From:   Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <fec3a57d-6b37-e5dd-4586-cdacf311159c@gmail.com>
Date:   Wed, 9 Jun 2021 18:28:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a6322fe86be905c028ede9ee2abee278266e1b35.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 09/06/2021 08:20, Philipp Zabel wrote:
> Hi Fabio,
> 
> On Tue, 2021-06-08 at 23:34 -0300, Fabio Estevam wrote:
>> Hi Philipp,
>>
>> On Tue, Jun 8, 2021 at 4:09 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>>
>>> The i.MX6 CSI-2 RX needs to see the LP-11 low power state on the lanes
>>> during streamon (before it calls the ADV7280-M s_stream(1)). That's
>>> where the LP-11 timeout error occurs.
>>>
>>> According to the ADV7280(-M) datasheet, "after the ADV7280-M is
>>> programmed, the clock lanes exit low power mode and remain in high speed
>>> mode until the part is reset or powered down."
>>> So it appears the ADV7280-M has to be freshly powered on in s_power(1)

Page 55 of the ADV7280-M HW Ref Manual shows how the CLK and DATA lanes 
can be (separately) forced into Ultra Low Power State. It mentions that 
when exiting ULPS it transmits the ULPS exit sequence, though it doesn't 
define what that sequence is. Perhaps this sequence includes 
transitioning through LP-11 enough to keep the CSI-2 RX happy?

Just a thought.
Regards,
Ian

>>
>> What do you mean by freshly powered on?
> 
> That the ADV7280-M is in the state before "the clock lanes exit low
> power mode" due to being "programmed". Basically I was hoping that after
> the initial reset sequence, and after power on, before the CSI-2
> registers are written, the clock lanes are in LP-11 state (and stay
> there until then).
> Unfortunately that doesn't appear to be the case below ...
> 
>>> for this to work. Is the ADV7280-M powerdown GPIO connected properly on
>>> your board? Moving the CSI-2 configuration from s_power to s_stream was
>>> exactly the right thing to do in my mind.
>>>
>>> Just as a test, if you remove the CSI-2 register writes from either
>>> s_power and s_stream from the adv7180 driver completely, do you still
>>> run into the LP-11 timeout? If the CSI-2 TX never leaves the low power
>>> state, I would expect seeing the clock lane timeout instead
>>
>> If I do this test, the first time I run the pipeline I get LP-11, the
>> second time I get clock lane timeout.
> 
> ... at least the first time.
> 
> So now I wonder what happens between the first and second time (in
> s_stream? in s_power(0)?) that does put the lanes into LP-11 from
> whatever state they were in before. When you get the clock lane timeout,
> is phy_state = 0x610? Does it stay there when you repeat this again?
> 
> regards
> Philipp
> 
