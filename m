Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 126DFDA8DE
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 11:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394047AbfJQJoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 05:44:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36411 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730885AbfJQJoG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 05:44:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id w18so984173wrt.3;
        Thu, 17 Oct 2019 02:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=WPP8fM4BAgo7I+1NaWLWc92Edu33AT6FVJmg54ang5E=;
        b=oFG2LIf7gajsb1vY737nWpSi1k5VHzfQkzRpD7x3c85lOQJ6Jkt2T8u3kcOc9nOhE+
         TgBvPebcdlDPtp2ZRqFXNlrPxycI1gNkzCBSweqroMK8j97AfkcTQt4c7LWCfv242Hvo
         KUMfDyaw+dDGWKZzYClD5adoZGlbE0cAI5hwIdturEeAOvGiXij34J8DtVby5JLcwGKt
         XfdtGRzNjLxoxGNJiYpjjb5YITtSF90Y4bYVBLiCuj6czPEytj4GVNyHotyb4kqtDFi9
         TImjph6EFB1tCC/7muPqBrGqoxzX9ry1d5IcbKnvE1k5+1pS1TXgSIs7hCvJf4Ml/h5H
         BWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=WPP8fM4BAgo7I+1NaWLWc92Edu33AT6FVJmg54ang5E=;
        b=M0EjM1dmg+j3ljvpikb4wRmxiMn2d39/9mV3p07qGqVq79iIB6HOwnXUv4xxh4r1w+
         d0/M2/5ySpUfvulgRHELnrrjzGJWlqvGuskEkyhhWHF81BfA25DKasA2kguHsA1WNIjR
         OV6X67+o4fDbcj8gGyhKit25z/cZFSgvlq6u9MwU0aF3jKlwGXz1YOAzua6ChK+JHAma
         8aLkyTbptTzkwtt79HtvJKopBQlJ+AHuiE1o0swmPbgju3JGEdlEOWBQOgIYFtqm3DK/
         d//+Tm8V04kB7MY2LzP4s9bMMuLebRh8gU4ELU0d2OkGrPag1Y7lwTRYAXdCGrI6yQUv
         9pWg==
X-Gm-Message-State: APjAAAWU5qwcOqf+Lj5UTZgVnyzPOrZu9swCbrV6mwTAEfjD+L0WNsdp
        poBCnceKXhIqSox1nVBg8h8m+OjQ/Zg=
X-Google-Smtp-Source: APXvYqyKkWTNWIuO9WZL6fxrNNqgIZcALneckDsL6VuBs7BrD8IMByxj+/XAJIzCKjHSblzF1dV5dw==
X-Received: by 2002:adf:d848:: with SMTP id k8mr2241596wrl.189.1571305442983;
        Thu, 17 Oct 2019 02:44:02 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id z13sm1591519wrq.51.2019.10.17.02.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 02:44:02 -0700 (PDT)
References: <20191015135915.6530-1-hslester96@gmail.com>
 <20191016090628.7l5u4ytdqr2jlasg@pengutronix.de>
 <m336fsst40.fsf@gmail.com>
 <20191017081029.q2czy7y5zlbj4ogr@pengutronix.de>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Chuhong Yuan <hslester96@gmail.com>, devel@driverdev.osuosl.org,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: imx7-mipi-csis: Add a check for
 devm_regulator_get
In-reply-to: <20191017081029.q2czy7y5zlbj4ogr@pengutronix.de>
Date:   Thu, 17 Oct 2019 10:43:59 +0100
Message-ID: <m31rvbso4g.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,
On Thu 17 Oct 2019 at 09:10, Marco Felsch wrote:
> Hi Rui,
>
> On 19-10-16 14:43, Rui Miguel Silva wrote:
>> Hi Marco,
>> On Wed 16 Oct 2019 at 10:06, Marco Felsch wrote:
>> > Hi Chuhong,
>> >
>> > On 19-10-15 21:59, Chuhong Yuan wrote:
>> >> devm_regulator_get may return an error but mipi_csis_phy_init misses
>> >> a check for it.
>> >> This may lead to problems when regulator_set_voltage uses the unchecked
>> >> pointer.
>> >> This patch adds a check for devm_regulator_get to avoid potential risk.
>> >>
>> >> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
>> >> ---
>> >> Changes in v2:
>> >>   - Add a check in mipi_csis_probe for the modified mipi_csis_phy_init.
>> >
>> > Did you miss the check for -EPROBE_DEFER?
>> >
>>
>> I think nothing special is really needed to do in case of
>> EPROBE_DEFER, or am I missing something?
>> It just return to probe and probe returns also. I just talked
>> about it because it was not cover in the original code.
>
> Yes, your are right... I shouldn't comment on anything I read with one
> eye. Sorry.
>

ehehe, no problem and thanks for your inputs.

---
Cheers,
	Rui

>
> Regards,
>   Marco
>
>> ---
>> Cheers,
>> 	Rui
>>
>> >
>> > Regards,
>> >   Marco
>> >
>> >>
>> >>  drivers/staging/media/imx/imx7-mipi-csis.c | 8 +++++++-
>> >>  1 file changed, 7 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
>> >> index 73d8354e618c..e8a6acaa969e 100644
>> >> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
>> >> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
>> >> @@ -350,6 +350,8 @@ static void mipi_csis_sw_reset(struct csi_state *state)
>> >>  static int mipi_csis_phy_init(struct csi_state *state)
>> >>  {
>> >>  	state->mipi_phy_regulator = devm_regulator_get(state->dev, "phy");
>> >> +	if (IS_ERR(state->mipi_phy_regulator))
>> >> +		return PTR_ERR(state->mipi_phy_regulator);
>> >>
>> >>  	return regulator_set_voltage(state->mipi_phy_regulator, 1000000,
>> >>  				     1000000);
>> >> @@ -966,7 +968,10 @@ static int mipi_csis_probe(struct platform_device *pdev)
>> >>  		return ret;
>> >>  	}
>> >>
>> >> -	mipi_csis_phy_init(state);
>> >> +	ret = mipi_csis_phy_init(state);
>> >> +	if (ret < 0)
>> >> +		return ret;
>> >> +
>> >>  	mipi_csis_phy_reset(state);
>> >>
>> >>  	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> >> --
>> >> 2.20.1
>> >>
>> >>
>> >>
>>
>>

