Return-Path: <linux-media+bounces-26499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6038FA3DFF0
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D374B188A883
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68861FF5FE;
	Thu, 20 Feb 2025 16:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="EGMyuEV0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F2F35958
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740067826; cv=none; b=oQ6EIV9CsxuS1MzznMzkEFvuymQzKsVTZIq1a6AdGG8oRuVmT/lmD8s10lePFgzWja1fiC10uor67xE0LsLDj9tTr8dUl/Q5mNcjwdYsW4rTWTicKTYuBFJM0v1mubKJchOjX2R0oIXvA7oqLG+j5sK8HkoGm88cZq7dPsWUOy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740067826; c=relaxed/simple;
	bh=vOBQSNxMyp0Klm4rVNeKE6W/p5rvnEq3gq4SYyqXykQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMaTsh16YdJcwfGEa6Y3PGzMsazZR4nPpVgIPL4uAwrY0eZhrOE7O/vlJPG8ZL7tD7zklukk1PBD5EwdEBDHst2HP0xgLbpZpQsoV/IgGWNUjTY/7N7Vt55y8mExZYuHjEsudseksNOF917VC8wwDRx58f/R/pS+fPwM5ZsvdtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=EGMyuEV0; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so930403276.2
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 08:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740067812; x=1740672612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J3TdOIZFV2hTSEZGxpDVWvVI6MEBamEFkOnDtXyooX8=;
        b=EGMyuEV0CqRQYk/sA/EAJs1KEXg43gD+2sX0X60L9c0Q3HrfbFQaLLUThExSDB97wE
         joNS5hzEa/4M7htAbpbakw8+XzAljLNy3nV/CG2rG5eRAT17Q6ZoPuB4p7L7IYqhF+/F
         ShsuP+9skW0Jp62lgnq8qpJEMlRiUzemZmPl0tTbjPLAhlQ7UTf9m5lSmLPVvOs6B14J
         za2NMmtzUXAbI7aQ4pFHJ0rB0sk1SaOAiUVtK07XZ4N77taZAX2O9rWU/TcdyN4+hZR1
         wuOvXCiFLgCHxLqVbV9V3x4ageiJokCfNG4MKGOsp8weJGc4VROZlEUkPx8/J3vQE7SS
         bmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740067812; x=1740672612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3TdOIZFV2hTSEZGxpDVWvVI6MEBamEFkOnDtXyooX8=;
        b=iagZAslcpCHNLm+wNuwSDSTUp1VHlMDN5LlvZa6pOTvZ8k44wX6YkktoR9imO5sqjq
         AsdpId8P4/3vx82cPWnXL5SQG0NsQEB8e9wzjhSA+N1PIZPOgn+EwtXSx6c5rDRrl1Oj
         nbSBY+VoUAuWQxT9L+N8iL2OboREzT8Vi6eQrmW0/weveBEXPTsDqsStOioOOFtxV0zF
         Blq4K9mpPKfQHYhu+WrjVn2oj0Y70X7EuFdTVjiIUcD4gygYlaxmY2612vuj1w+ZjDgH
         E1taD0B3UR+68vOWgPD/xlqzP62p12djdntwTial75RQq4S99Hh79z4P6xyhp1CMPanY
         PuMw==
X-Gm-Message-State: AOJu0YxyPi7t0SPIrIAD70x+SfCh+IGt6efxf+1rHRGM71CiDtOqH8Hh
	oL7+PTtcFAiRhL+zHWl02HxSSXT1nDofTNjluWHCz5cBcyAya88+5n8foklK1SIPEIpj9WcScR1
	8qWKDGcW3a8DLsKb4uU2BNHN/cOQubI0mctymzUFA9jXbasRRPcA=
X-Gm-Gg: ASbGncvggbPlwnCl6bvXF/oh3K+UKbz6bQHO7LKMTfdJOyzyjesri2XEBx0DnerLzk7
	o0YYWKvzUuYFwVfhfTY1zmZyb2IH7yaLw3oTf61epW50shTCboFIU7OISiibZWbzOotTiUe0SWQ
	Tg2rRRKJ+5TAuGqm97S/O7XUhL7ul0
X-Google-Smtp-Source: AGHT+IHrTyen02jhiIoc4OMiNJTzRVXSga3xySnRYSbbL5x2OzQudC+8rSwDvtypOwnsm1L37gXL3cLNe64BVyB4S+Y=
X-Received: by 2002:a05:690c:23ca:b0:6f9:4bb6:eb46 with SMTP id
 00721157ae682-6fba57cc238mr79511507b3.31.1740067812585; Thu, 20 Feb 2025
 08:10:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219094637.607615-1-eagle.alexander923@gmail.com>
In-Reply-To: <20250219094637.607615-1-eagle.alexander923@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 20 Feb 2025 16:09:55 +0000
X-Gm-Features: AWEUYZmFeW_npNuAp9dRIa2RHf4OvWpXilW4hXP_kZGDpXggy17B7oUWm1CI6WI
Message-ID: <CAPY8ntCoHsbvbxGrQ17tp62XWKV322t2tCg=gfAD=WOyMiBbCg@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: i2c: imx415: Add get_mbus_config() pad
 operation support
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Michael Riesch <michael.riesch@wolfvision.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexander

On Wed, 19 Feb 2025 at 09:57, Alexander Shiyan
<eagle.alexander923@gmail.com> wrote:
>
> Allow the driver to report static media bus configuration using
> pad get_mbus_config() operation.
>
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/media/i2c/imx415.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 9f37779bd611..16a52900c61c 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -1076,6 +1076,18 @@ static int imx415_init_state(struct v4l2_subdev *sd,
>         return 0;
>  }
>
> +static int imx415_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad_id,
> +                                 struct v4l2_mbus_config *config)
> +{
> +       struct imx415 *sensor = to_imx415(sd);
> +
> +       config->type = V4L2_MBUS_CSI2_DPHY;
> +       config->bus.mipi_csi2.flags = 0;
> +       config->bus.mipi_csi2.num_data_lanes = sensor->num_data_lanes;

I'll let others confirm, but I believe the expectation is that the
platform configuration would set this for both sensor and CSI2
receiver.
get_mbus_config is only used where the number of lanes can dynamically change.

I'm also trying to find confirmation in the IMX415 datasheet of
whether it drops to LP for the clock lane or not. If it does, then you
want to set V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK in the flags field.
It's not obviously mentioned, so I may resort to getting an
oscilloscope out on it.

  Dave

> +
> +       return 0;
> +}
> +
>  static const struct v4l2_subdev_video_ops imx415_subdev_video_ops = {
>         .s_stream = imx415_s_stream,
>  };
> @@ -1086,6 +1098,7 @@ static const struct v4l2_subdev_pad_ops imx415_subdev_pad_ops = {
>         .get_fmt = v4l2_subdev_get_fmt,
>         .set_fmt = imx415_set_format,
>         .get_selection = imx415_get_selection,
> +       .get_mbus_config = imx415_get_mbus_config,
>  };
>
>  static const struct v4l2_subdev_ops imx415_subdev_ops = {
> --
> 2.39.1
>
>

