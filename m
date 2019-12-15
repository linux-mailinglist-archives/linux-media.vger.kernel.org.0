Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5219811F9BC
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfLORfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 12:35:54 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37100 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbfLORfy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 12:35:54 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep17so1958690pjb.4
        for <linux-media@vger.kernel.org>; Sun, 15 Dec 2019 09:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=85nlbiKq3rpWsz2dGxuU4NqF4J9BzTqVbiVO4kippfs=;
        b=tQIuy/2HcSdEay7ekVyEGAsa4RSKJtYFmcBDN3MlSjp8wysm9Xpf0fq/KgE/GU6Zkc
         uwqRgv3TuBK9XAd3A1wQ77riVWT49jovChLRJl9H0M12+E9J7+i82TM/4VhRxkTRxkzR
         wa8hq05Z2iiRMBMUCRRe0M5986rrL+V6rvrDSluKjnCF986cq4znIm1a3LO3UTkNysfS
         HIByxSxltXtAI9etxUc70cpBugSlOCbN6XsJkJKdbx8pJcT7gxZBINadrTQ6d83ptbqO
         CGRMwMhNAN32Y8YNJmQJkVvhTeSKrol3GWcuCKv094Zb5Za287OMVT3p6eEBhcA1ZY+K
         xHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=85nlbiKq3rpWsz2dGxuU4NqF4J9BzTqVbiVO4kippfs=;
        b=H79xdi6iWko+9skm9slSAFlEJj81uSN6YCl1trvbjstixbnufF6TuKcq6EdJMHR11f
         3BnIOq9MT9y9gw45KzT8E3koxHPMbh8TTs6OSnUXnF9FgpERocN4/qXDdEmrHJ8Z6b/m
         /bzWn/qZv7t6JF3mthahxe51wBCkxn7xmK35SUVvOpLdrWW2nEhbus3szy2tko4jVNE7
         yfwfDR+ncoUpxqCSdPSqnjBPu18bvms/Agt/U7jaqIfVbjjuvhAwvSg1ZxcJByD8sQjM
         at4Itdn9z4552G3XCPX2R526hlLtLLadFQdO7tki4EOPj0sr7ZDYtxDHQjySS/hyQC/0
         W/Qw==
X-Gm-Message-State: APjAAAXecLlN5nLjemNKPENKD4BthBy97MPqQtVdN+8OhsyqUFXv8pBn
        nzrD0zKN0zNWUx885wLJ9hBc
X-Google-Smtp-Source: APXvYqxaLfB48R/yYSynM4mJt1uNrHQ/vR38PBU61rkRabHdtFR6nTdX3wg7HpbcKSK67x5dyusrXA==
X-Received: by 2002:a17:902:b609:: with SMTP id b9mr11776684pls.70.1576431353150;
        Sun, 15 Dec 2019 09:35:53 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:78f:3e30:ad66:df45:6a09:a260])
        by smtp.gmail.com with ESMTPSA id g19sm18735361pfh.134.2019.12.15.09.35.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:35:52 -0800 (PST)
Date:   Sun, 15 Dec 2019 23:05:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH 2/5] media: i2c: imx290: Add support for test pattern
 generation
Message-ID: <20191215173542.GB11427@Mani-XPS-13-9360>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
 <20191129190541.30315-3-manivannan.sadhasivam@linaro.org>
 <20191203084850.GA5282@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203084850.GA5282@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Dec 03, 2019 at 10:48:50AM +0200, Sakari Ailus wrote:
> Hi Manivannan,
> 
> On Sat, Nov 30, 2019 at 12:35:38AM +0530, Manivannan Sadhasivam wrote:
> > Add support for generating following test patterns by IMX290:
> > 
> > * Sequence Pattern 1
> > * Horizontal Color-bar Chart
> > * Vertical Color-bar Chart
> > * Sequence Pattern 2
> > * Gradation Pattern 1
> > * Gradation Pattern 2
> > * 000/555h Toggle Pattern
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/media/i2c/imx290.c | 41 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 40 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 1d49910937fb..e218c959a729 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -26,12 +26,19 @@
> >  #define IMX290_REGHOLD 0x3001
> >  #define IMX290_XMSTA 0x3002
> >  #define IMX290_FR_FDG_SEL 0x3009
> > +#define IMX290_BLKLEVEL_LOW 0x300a
> > +#define IMX290_BLKLEVEL_HIGH 0x300b
> >  #define IMX290_GAIN 0x3014
> >  #define IMX290_HMAX_LOW 0x301c
> >  #define IMX290_HMAX_HIGH 0x301d
> > +#define IMX290_PGCTRL 0x308c
> >  #define IMX290_PHY_LANE_NUM 0x3407
> >  #define IMX290_CSI_LANE_MODE 0x3443
> >  
> > +#define IMX290_PGCTRL_REGEN BIT(0)
> > +#define IMX290_PGCTRL_THRU BIT(1)
> > +#define IMX290_PGCTRL_MODE(n) ((n) << 4)
> > +
> >  /* HMAX fields */
> >  #define IMX290_HMAX_2_1920 0x1130
> >  #define IMX290_HMAX_4_1920 0x0898
> > @@ -99,6 +106,17 @@ static const struct regmap_config imx290_regmap_config = {
> >  	.cache_type = REGCACHE_RBTREE,
> >  };
> >  
> > +static const char * const imx290_test_pattern_menu[] = {
> > +	"Disabled",
> > +	"Sequence Pattern 1",
> > +	"Horizontal Color-bar Chart",
> > +	"Vertical Color-bar Chart",
> > +	"Sequence Pattern 2",
> > +	"Gradation Pattern 1",
> > +	"Gradation Pattern 2",
> > +	"000/555h Toggle Pattern",
> > +};
> > +
> >  static const struct imx290_regval imx290_global_init_settings[] = {
> >  	{ 0x3007, 0x00 },
> >  	{ 0x3018, 0x65 },
> > @@ -394,6 +412,22 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	case V4L2_CID_GAIN:
> >  		ret = imx290_set_gain(imx290, ctrl->val);
> >  		break;
> > +	case V4L2_CID_TEST_PATTERN:
> > +		if (ctrl->val) {
> > +			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x00);
> > +			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
> > +			mdelay(10);
> 
> Any particular reason for a busy loop instead of sleeping? Same below.
> 

Nothing. I should've used msleep() here... Will change it.

Thanks,
Mani

> > +			imx290_write_reg(imx290, IMX290_PGCTRL,
> > +					 (u8)(IMX290_PGCTRL_REGEN |
> > +					 IMX290_PGCTRL_THRU |
> > +					 IMX290_PGCTRL_MODE(ctrl->val)));
> > +		} else {
> > +			imx290_write_reg(imx290, IMX290_PGCTRL, 0x00);
> > +			mdelay(10);
> > +			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x3c);
> > +			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
> > +		}
> > +		break;
> >  	default:
> >  		ret = -EINVAL;
> >  		break;
> > @@ -878,7 +912,7 @@ static int imx290_probe(struct i2c_client *client)
> >  
> >  	mutex_init(&imx290->lock);
> >  
> > -	v4l2_ctrl_handler_init(&imx290->ctrls, 3);
> > +	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
> >  
> >  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> >  			  V4L2_CID_GAIN, 0, 72, 1, 0);
> > @@ -896,6 +930,11 @@ static int imx290_probe(struct i2c_client *client)
> >  					       INT_MAX, 1,
> >  					       imx290_modes[0].pixel_rate);
> >  
> > +	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
> > +				     V4L2_CID_TEST_PATTERN,
> > +				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> > +				     0, 0, imx290_test_pattern_menu);
> > +
> >  	imx290->sd.ctrl_handler = &imx290->ctrls;
> >  
> >  	if (imx290->ctrls.error) {
> 
> -- 
> Sakari Ailus
