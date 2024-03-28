Return-Path: <linux-media+bounces-8089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C3188FD71
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 11:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A443B24DB8
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 10:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA247D3FB;
	Thu, 28 Mar 2024 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y2Q9AwJG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE397BB1F
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711623200; cv=none; b=M4HObdLKS3kzYS+478BREdX0+tWfldndCRrhGe0DXLwkBNS+WYZi81EtFtOtq4QyItYvnh0GlByCSR2cF5QGz3KEeJOmdUOUnzHjpOEuClRFbMkkV/7x9h87S4yU06KuwGBwjhkSgpL3mhu7/w4kLZnkCIMhvtCaP0FcFFQgIbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711623200; c=relaxed/simple;
	bh=8ExBUa0/P48Kj4BBRQvWObr5Ay7wH+a0Yu9nMxzh3Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaXQWj9BPbQ6XFel76l/chRxJ2euA1/Xzwd20scU4BQZLQSATSMtAmJ16AZkg/Q008xee3YMEJPFuRlCL3T479XxwTQb+UqTPIogWxybgmpetmeCOZDHCNaqmRAG1yh2XCUKbuD/cgf7sCrIFAugbFNeCbLM4ujPkQjqAfkTMj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y2Q9AwJG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38DC9D20;
	Thu, 28 Mar 2024 11:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711623162;
	bh=8ExBUa0/P48Kj4BBRQvWObr5Ay7wH+a0Yu9nMxzh3Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2Q9AwJGNV/Fm6wspCYdwU/JXQbgijUl1/e+YtYZGTW14kCISFaaVTFUTQJtBW1wN
	 3e5Q4hey8WbnbV7t1VH9R7LmYsovHpuNkeTyc1b/2C6JypQ5OvA544mHqnXqzH62UD
	 eGp41GGNcHdoy02+tue9+QpZCatqG2ldhV8aj8OI=
Date: Thu, 28 Mar 2024 12:53:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, linux-media@vger.kernel.org,
	dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: imx219: Use dev_err_probe on probe
Message-ID: <20240328105305.GB26064@pendragon.ideasonboard.com>
References: <20240311090042.30280-1-umang.jain@ideasonboard.com>
 <Ze7shcxM/v1+FHCm@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <b949d192-9ea5-489a-91a9-2b055ec47b22@ideasonboard.com>
 <20240314152147.GB2441@pendragon.ideasonboard.com>
 <7b3724aa-04ac-463c-834a-3902fae4b505@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b3724aa-04ac-463c-834a-3902fae4b505@ideasonboard.com>

Hi Umang,

On Fri, Mar 15, 2024 at 12:13:15PM +0530, Umang Jain wrote:
> On 14/03/24 8:51 pm, Laurent Pinchart wrote:
> > On Thu, Mar 14, 2024 at 06:51:04PM +0530, Umang Jain wrote:
> >> On 11/03/24 5:05 pm, Tommaso Merciai wrote:
> >>> On Mon, Mar 11, 2024 at 02:30:42PM +0530, Umang Jain wrote:
> >>>> Drop dev_err() and use the dev_err_probe() helper on probe path.
> >>>>
> >>>> No functional changes intended.
> >>>>
> >>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >>>> ---
> >>>>    drivers/media/i2c/imx219.c | 64 +++++++++++++++++++-------------------
> >>>>    1 file changed, 32 insertions(+), 32 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> >>>> index e17ef2e9d9d0..acd27e2ef849 100644
> >>>> --- a/drivers/media/i2c/imx219.c
> >>>> +++ b/drivers/media/i2c/imx219.c
> >>>> @@ -551,8 +551,9 @@ static int imx219_init_controls(struct imx219 *imx219)
> >>>>    
> >>>>    	if (ctrl_hdlr->error) {
> >>>>    		ret = ctrl_hdlr->error;
> >>>> -		dev_err(&client->dev, "%s control init failed (%d)\n",
> >>>> -			__func__, ret);
> >>>> +		dev_err_probe(&client->dev, ret,
> >>>> +			      "%s control init failed\n",
> >>>> +			      __func__);
> >
> > ctrl_hdlr->error can never be -EPROBE_DEFER, is dev_err_probe() really
> > useful here ?
> 
> is dev_err_probe() really /only/ about -EPROBE_DEFER ?  or all probe() 
> errors?
> 
> The documentation is explicitly stating for dev_Err_probe()
> 
> ```
>   * Note that it is deemed acceptable to use this function for error
>   * prints during probe even if the @err is known to never be -EPROBE_DEFER.
>   * The benefit compared to a normal dev_err() is the standardized format
>   * of the error code and the fact that the error code is returned.
>   *
> 
> ```

As in so many cases, it's partly a matter of taste :-) When it comes to
changes such as

-		dev_err(dev, "xclk frequency not supported: %d Hz\n",
-			imx219->xclk_freq);
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL,
+				     "xclk frequency not supported: %d Hz\n",
+				     imx219->xclk_freq);

I find the resulting less readable. The indentation is higher, you have
to look at the parameters to dev_err_probe() to see what is returned
(compared to reading "return -EINVAL"), and adding the error code to the
printed message also makes the kernel log less as the error code really
doesn't need to be printed in this case.

> >>>>    		goto error;
> >>>>    	}

[snip]

-- 
Regards,

Laurent Pinchart

