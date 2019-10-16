Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2482DD92C2
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 15:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392005AbfJPNoL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 09:44:11 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51060 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729093AbfJPNoL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 09:44:11 -0400
Received: by mail-wm1-f65.google.com with SMTP id 5so3008679wmg.0;
        Wed, 16 Oct 2019 06:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=Bafgp4jYGnLo/xet8UtFIBOpzKesPTarPqBx8mm1ghI=;
        b=PR02Gxdt3nLUj5CA3FhgPxpb2Pejo0uJv6oewhFi4gFnZfhfQLk1KDR6cRT5Bg1Y8G
         b0Z8H6bCwhLBqk5nevl2yYyz3hmUxRfSO0R3TlgGrw3CLY/hcpwBPOgP9lX9wfc3GgV2
         9oF7evBFpNZl8hoN5ENCFZ7nFmZNRJ2bSfKgR3P4NqbOKqz7XTgNkaa1w0fOZqroxfQy
         FRpBjAUAO4h3dChpTRrnH6DYycnW8hLiOjGTgK5sHDL5oRtptBl6QspTY1ITso1CmtmR
         58U2hXO6xsWqgSwp1aQt2TqWCNyDO2UX0pP6hPm7zLbV9oQp8M93Tq8VqCMREHy0toHv
         PRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=Bafgp4jYGnLo/xet8UtFIBOpzKesPTarPqBx8mm1ghI=;
        b=PJuxIPXRyEZ4JO71MwPtM4bTZpxqLVGwIe6ACVde8oESufeGLYxF/RQwA3SuevuZoG
         HIKGs3yMOhPFhDR3j1dVYdhahHDMI0a9Bww/0fyyUx8SP/VEWWGUWnIHXtduD+7p3fLv
         6jBAOB+jCTNQabivyLlM9UXTx0oisk1aH7VAOxABugPxlTUxN+LrtH8T6U6ux7i3QBPk
         NtjWDcZvYECjGH1lXCH3khdCXhbdxqvBweVBjS85AQEOFr4jSWuJWy35HgTkW+B2CzgY
         N3me44E+/Wx1DC0QiV8hPTOdooZiok5+KVxobXVpVUn/PPupJqsnxP5lifP2nUDMCzS7
         zIMg==
X-Gm-Message-State: APjAAAVh+zVIsk4uFTFRBDMX32qs1hWZ9se1fhqJAe05KS9pbQSCGtwD
        9XqgHk7KMEMSmiTI6luR1cXGbfRgxjo=
X-Google-Smtp-Source: APXvYqyB+z261XSi/xNHUTIkW7HCqAaCgNNk5jZlZTw9o+jzwNhtu889hivFUMlUicQi2ELvoiv9yA==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr3723254wmb.127.1571233447045;
        Wed, 16 Oct 2019 06:44:07 -0700 (PDT)
Received: from arch-late (87-196-73-205.net.novis.pt. [87.196.73.205])
        by smtp.gmail.com with ESMTPSA id r13sm37949311wrn.0.2019.10.16.06.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 06:44:06 -0700 (PDT)
References: <20191015135915.6530-1-hslester96@gmail.com>
 <20191016090628.7l5u4ytdqr2jlasg@pengutronix.de>
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
In-reply-to: <20191016090628.7l5u4ytdqr2jlasg@pengutronix.de>
Date:   Wed, 16 Oct 2019 14:43:59 +0100
Message-ID: <m336fsst40.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,
On Wed 16 Oct 2019 at 10:06, Marco Felsch wrote:
> Hi Chuhong,
>
> On 19-10-15 21:59, Chuhong Yuan wrote:
>> devm_regulator_get may return an error but mipi_csis_phy_init misses
>> a check for it.
>> This may lead to problems when regulator_set_voltage uses the unchecked
>> pointer.
>> This patch adds a check for devm_regulator_get to avoid potential risk.
>>
>> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
>> ---
>> Changes in v2:
>>   - Add a check in mipi_csis_probe for the modified mipi_csis_phy_init.
>
> Did you miss the check for -EPROBE_DEFER?
>

I think nothing special is really needed to do in case of
EPROBE_DEFER, or am I missing something?
It just return to probe and probe returns also. I just talked
about it because it was not cover in the original code.

---
Cheers,
	Rui

>
> Regards,
>   Marco
>
>>
>>  drivers/staging/media/imx/imx7-mipi-csis.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
>> index 73d8354e618c..e8a6acaa969e 100644
>> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
>> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
>> @@ -350,6 +350,8 @@ static void mipi_csis_sw_reset(struct csi_state *state)
>>  static int mipi_csis_phy_init(struct csi_state *state)
>>  {
>>  	state->mipi_phy_regulator = devm_regulator_get(state->dev, "phy");
>> +	if (IS_ERR(state->mipi_phy_regulator))
>> +		return PTR_ERR(state->mipi_phy_regulator);
>>
>>  	return regulator_set_voltage(state->mipi_phy_regulator, 1000000,
>>  				     1000000);
>> @@ -966,7 +968,10 @@ static int mipi_csis_probe(struct platform_device *pdev)
>>  		return ret;
>>  	}
>>
>> -	mipi_csis_phy_init(state);
>> +	ret = mipi_csis_phy_init(state);
>> +	if (ret < 0)
>> +		return ret;
>> +
>>  	mipi_csis_phy_reset(state);
>>
>>  	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> --
>> 2.20.1
>>
>>
>>

