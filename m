Return-Path: <linux-media+bounces-28933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC048A74E35
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A97EE1893A77
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 16:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931A71D89E9;
	Fri, 28 Mar 2025 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="YAFLYNx8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F901A83F5;
	Fri, 28 Mar 2025 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743177909; cv=none; b=BUPeqSRgS0ZBZmcdurf0CZVifrPwlxF+RkFJb/C4iu3QbC7iwOAPNh8s+M9ab20gdeO6RyxFKOug+Rao1LeddGODLcSnclhJGl5bHqEmN6zOr2tTn730Ouhk18lw06ZnGH/gMBsrimOXA4F68DVlt9HUB2Xm7wrrSVpTUsAPnTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743177909; c=relaxed/simple;
	bh=63Zxti0UOqa/YeSAiShlm0Tc9Aa0CS44NzTMCz7kh8Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R1bSKJirpjdWACOlSiRk25j8HXgbOFJiGcdBHQokDOqYRgURUbh3CHz8TVhlYLiqubxvbma+3vyfcFYFq9eBFBU2MQgYDbaQrQ5JiGWOnsGLp+St2gcIXRNHs78zLimtCfgmi+CcO+u1c1jnrDKgSbIt6SSq36JOApPneADyOW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=YAFLYNx8; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1743177892; x=1743437092;
	bh=ZxQ+xr0xFeXTk3ynjL8AvcVvpsmYEsJZla0J2oGJsMU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=YAFLYNx86+h1KWXzxSZ0A3rz1XvwB75Gu5eRcCxZZ7pbi0gLKRD2uTFcpuvPUgxYs
	 H9gUOdAiEJD/bcRH62ZtHVD9Fns2VMz88SJfpSVyfjN8inLT6y988XG3YPONWoj+94
	 Xm7Fk32JbNzOyre0NFLFAOCaSuVYMM+B4ERxKj73BJdhTdcKAP2Lq0JWcwrFfJ2l1g
	 KVGcjxRhuTujqcwELum3KD/56kZ0P4DPStaw26TZWtzYcHtHgjOB+zrIhHRoqsG50s
	 CBrDRsusBVfafIPsMt5pULFm4tCIH3pBB8K9coj0EtMB90csgowMcMmMxu06c3IGGF
	 +yjRsVTwCdjFA==
Date: Fri, 28 Mar 2025 16:04:44 +0000
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, quic_vgarodia@quicinc.com, stanimir.k.varbanov@gmail.com
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: Re: [PATCH] media: venus: Fix probe error handling
Message-ID: <18db1590-ab88-4522-b1c3-6a0557313c6d@nxsw.ie>
In-Reply-To: <20250327125304.1090805-1-loic.poulain@oss.qualcomm.com>
References: <20250327125304.1090805-1-loic.poulain@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: a72e690f5cdc5069410dd1badd933455cc47e2e7
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 27/03/2025 12:53, Loic Poulain wrote:
> Video device registering has been moved earlier in the probe function,
> but the new order has not been propagated to error handling. This means
> we can end with unreleased resources on error (e.g dangling video device
> on missing firmware probe aborting).
>=20
> Fixes: 08b1cf474b7f7 ("media: venus: core, venc, vdec: Fix probe dependen=
cy error")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index c4438e4b2d9b..103afda799ed 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -438,7 +438,7 @@ static int venus_probe(struct platform_device *pdev)
>=20
>   =09ret =3D v4l2_device_register(dev, &core->v4l2_dev);
>   =09if (ret)
> -=09=09goto err_core_deinit;
> +=09=09goto err_hfi_destroy;
>=20
>   =09platform_set_drvdata(pdev, core);
>=20
> @@ -476,24 +476,24 @@ static int venus_probe(struct platform_device *pdev=
)
>=20
>   =09ret =3D venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
>   =09if (ret)
> -=09=09goto err_venus_shutdown;
> +=09=09goto err_core_deinit;
>=20
>   =09ret =3D venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
>   =09if (ret)
> -=09=09goto err_venus_shutdown;
> +=09=09goto err_core_deinit;
>=20
>   =09ret =3D pm_runtime_put_sync(dev);
>   =09if (ret) {
>   =09=09pm_runtime_get_noresume(dev);
> -=09=09goto err_dev_unregister;
> +=09=09goto err_core_deinit;
>   =09}
>=20
>   =09venus_dbgfs_init(core);
>=20
>   =09return 0;
>=20
> -err_dev_unregister:
> -=09v4l2_device_unregister(&core->v4l2_dev);
> +err_core_deinit:
> +=09hfi_core_deinit(core, false);
>   err_venus_shutdown:
>   =09venus_shutdown(core);
>   err_firmware_deinit:
> @@ -506,9 +506,9 @@ static int venus_probe(struct platform_device *pdev)
>   =09pm_runtime_put_noidle(dev);
>   =09pm_runtime_disable(dev);
>   =09pm_runtime_set_suspended(dev);
> +=09v4l2_device_unregister(&core->v4l2_dev);
> +err_hfi_destroy:
>   =09hfi_destroy(core);
> -err_core_deinit:
> -=09hfi_core_deinit(core, false);
>   err_core_put:
>   =09if (core->pm_ops->core_put)
>   =09=09core->pm_ops->core_put(core);
> --
> 2.34.1
>=20
>=20
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>


