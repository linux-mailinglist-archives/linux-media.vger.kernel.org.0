Return-Path: <linux-media+bounces-15119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB2934F1D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 16:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D07A282C5E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 14:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0091F143863;
	Thu, 18 Jul 2024 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hH58ADin"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0224713C9CF;
	Thu, 18 Jul 2024 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721313109; cv=none; b=r87mtxnSNXzsZKXFQjheZNGA2yIXx1sJpHgBGotDbL95duGcvSkJCoEyVvKtHxYszd3ol0ouQtU5skzW4ZVQ0QAaz+SXJ3fUbD2ZJNAsQlvL/YGElxKB3fPKUwC/Hf72UgcECtRqjxaZgSX2WzIu9deLm+9obWVSq1WSIiOe7VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721313109; c=relaxed/simple;
	bh=bsRtTEMFMyiOKG6+6H1MC0nu1CQwdAkjGuoqXfx9ZzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qasyGO6+eQILmLBh8a4h9dacGtE3VZmqMYRbffKWED6tOPlBGXRn+FsQnkTdZElpn0Kq3spHBJThBmR9ykeaapZ0mCAYl0vs64Uvr5JvUHPeZ+BoDgNOmtJ0xpfzYxWp2x2WJTKlR3CJBe3JbSJBcZC6COM7KJgoT01q35H01lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hH58ADin; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-158-41.net.vodafone.it [5.91.158.41])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B243766;
	Thu, 18 Jul 2024 16:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721313067;
	bh=bsRtTEMFMyiOKG6+6H1MC0nu1CQwdAkjGuoqXfx9ZzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hH58ADinG9Pk/p8GF/PaPm8EblmvUJZ1HSLw5v220zHjWQIR7kdi1CIA49agAhTDP
	 QwAl/b6PGPhPENVaANz7kfRVuHZAgrZmg8V/PmAX+q7eCbZOCLaa6Hld4Odqk3nlnl
	 td0FgTpy0tEaBxmhZnMwVG6deAAR1FUDswNvv//c=
Date: Thu, 18 Jul 2024 16:31:42 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Keith Zhao <keith.zhao@starfivetech.com>, 
	Jayshri Pawar <jpawar@cadence.com>, Jai Luthra <j-luthra@ti.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/5] media: cadence: csi2rx: Add system PM support
Message-ID: <ozikmyczwjig6mawmgo7bxzbsup3uxvscxhvu3qhmxnhopedtx@373um4bhd3nz>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
 <20240718032834.53876-3-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240718032834.53876-3-changhuang.liang@starfivetech.com>

Hi Changhuang

On Wed, Jul 17, 2024 at 08:28:31PM GMT, Changhuang Liang wrote:
> Add system PM support make it stopping streaming at system suspend time,
> and restarting streaming at system resume time.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Looks ok to me!

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 32 ++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 981819adbb3a..81e90b31e9f8 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -776,8 +776,40 @@ static int csi2rx_runtime_resume(struct device *dev)
>  	return ret;
>  }
>
> +static int __maybe_unused csi2rx_suspend(struct device *dev)
> +{
> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> +
> +	mutex_lock(&csi2rx->lock);
> +	if (csi2rx->count)
> +		csi2rx_stop(csi2rx);
> +	mutex_unlock(&csi2rx->lock);
> +
> +	pm_runtime_force_suspend(dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused csi2rx_resume(struct device *dev)
> +{
> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	mutex_lock(&csi2rx->lock);
> +	if (csi2rx->count)
> +		csi2rx_start(csi2rx);
> +	mutex_unlock(&csi2rx->lock);
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops csi2rx_pm_ops = {
>  	SET_RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(csi2rx_suspend, csi2rx_resume)
>  };
>
>  static const struct of_device_id csi2rx_of_table[] = {
> --
> 2.25.1
>
>

