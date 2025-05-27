Return-Path: <linux-media+bounces-33440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA194AC49D9
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 10:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C9AD189C051
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 08:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD9424888D;
	Tue, 27 May 2025 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2hc46ua"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D935973
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 08:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748333019; cv=none; b=lGLrumwgCYnYlw0IhaxpYuvCFn+eSm/l40cDklALSoYo8j4IVETAGW1waIumh4My7Daeu1clADcDgS5maAATB+yr0hoIowzCVivU1nZZ5A5pcMgl9F089dNWx/tS6Z3iuXATTZD3afvaRMKMakGZVgzSdGjXDz4h6CKjtJ6toT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748333019; c=relaxed/simple;
	bh=Tw9ffwQSUHNvyxxLxyULMg0IrOoGoCqTvETlYCaMMqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhTBuUrlgr4YASmZpCQZga5QkrSsr7nV3YEbAtzaoPFNopYTl+hPHeYBpqJdIkekHP9B5QEeeyQVV4cKHIn7tg/FlmsI0vUCafSPZLtwWSijKE8EEWI7BopzU3sDyukWrf57gr+Y4e0xo99RCN4Djig20UKTZvX6k7DtU1IN1ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2hc46ua; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R3umWS003683
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 08:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WszIx7VZPFdEt7VkNEWoJMRWvZp4/gfefKzR4VSfgHY=; b=V2hc46uaLxWmRLCm
	EOnm+y8gaJHafeIsxrvwFpxmMOhI6SEKwkBc1QUy7z4lbYRDoJpNcHgD0u/rWQY4
	2tpKX4p9oIsLTIBC95Rf3LiZdNaeBw3WSddSdHmaG/G3xw+3EKjGeoXgpbjU4Rpd
	ROOT01JbrefJx0szPpNCDSuIYk0b13k4DIqrWJ97F+2rjpE4kdqUCelXkiQjmlwI
	3qc183W6T2eY5EmQgP3TeeqSMla+1KnTJwfNafMiruldET2WU8lod0UceeDg5oFE
	tFB7rN42EHpgXMP/MBQAs+2sLGHNM9VqTH/3PI+VWHT00OdVC8D6Eym3Q+eB5fd5
	LnaupA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejx3ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 08:03:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae8b206a4so70550601cf.0
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 01:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748333015; x=1748937815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WszIx7VZPFdEt7VkNEWoJMRWvZp4/gfefKzR4VSfgHY=;
        b=VCD/VC6XIaYcY2JBHuF71dqYT/mLO2vPodw7VOYG4xyRoQll5/+Ybni86RAYOPWRlO
         gflfl5ioXsVH0Edpi/s/DFdhA3TJ8rKSUFZenTHAsnu+Owd7oZZGZ4v7Mc9qFvIU8gLE
         XYw/60hv+bPdXNbKAM49rzjtbFgWxTADNKedNNFp5uypl9LsUN2AxBRYdTpLewqroRT0
         h9GwhRYgOYdbQoJPTCePhVwstgepHxyOpJy7f01a8DeTH34d3RSKjeqBgl3trwXkT/89
         DkIfrye8K7PRRfraPnYGB5egeEOZiNP9Z0Rw4EyE6seV6SMK4vJg4CVW5jeF/50+5HHs
         UsWA==
X-Forwarded-Encrypted: i=1; AJvYcCVsuQRLunMhfjphFfiRFYKnBRoOJPbP9sT2lEKROLisSlGm6WWSGb+OoNTXXPkSEuKbT9LR/uc0ThMHEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywag6m8pcTKe7DMZEKRJ+TgrZC94E/60FylS8Qgy7DVDOg8eBhD
	jviSy/boX/aeqgIe4yc+pPoAxOSZICEdDrbPme2sQE5TdonY+5bZIRywsI0hrbjTeS3CzCW9xqX
	gNLDOXoTRHUxd6VLH69oWiXEKRn1Hm5iacIp3Sg4NMjNRiF9bXgS3W/PmkIzLvCgR1Ohdb0b1Ae
	dt0Mu0uXM6JOYee5IXZmN42QhvPK3lOppq2Y3Ypxou
X-Gm-Gg: ASbGncsnYobXJxEGPaTYeW/uhq85x+IQ0Gk2IXlGU7tG952g2RkBVboxEuLVhVoL+zt
	ZV0JNHAXkOpCyBEQzAiv64ffFWnVDmDsZ3cStZsKcOxdIIfEIaKPCCy9sPRkyOiz0/YBtywE=
X-Received: by 2002:a05:622a:4aca:b0:477:5d12:aac5 with SMTP id d75a77b69052e-49f47a0ca9emr227859951cf.35.1748333015229;
        Tue, 27 May 2025 01:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9K0UfrrHrFrugVr3HImed0MsIRNZ4y7HGt51ljMFTYLA0juwBYp8qblGlD4jS1tkmrbVirdWOBR46VvpqX3I=
X-Received: by 2002:a05:622a:4aca:b0:477:5d12:aac5 with SMTP id
 d75a77b69052e-49f47a0ca9emr227859511cf.35.1748333014893; Tue, 27 May 2025
 01:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526232837.686822-3-mailingradian@gmail.com>
In-Reply-To: <20250526232837.686822-3-mailingradian@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 May 2025 10:03:23 +0200
X-Gm-Features: AX0GCFuEESA_UG-xuTSPOEsVzkLJoG02sDE_VKiTeY9dagCcyyVqht-Cyly0QJA
Message-ID: <CAFEp6-2mhuLptwA4JYJm2cvftZxufoJGB0y94LAd5ZWGP1e-RA@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Power pipeline only when streaming
To: Richard Acayan <mailingradian@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=683571d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=pGLkceISAAAA:8 a=rXl6UsPILG4lY9eO-DUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: KJPg95hCiyDLXE0aa9TJUQjadIFDGKKV
X-Proofpoint-GUID: KJPg95hCiyDLXE0aa9TJUQjadIFDGKKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA2NCBTYWx0ZWRfX2ML/C/0vkh+0
 424nx5+DeHYmxcvtSukE2T3TmGPdYY7qV/8tYV5v1TIp4lp8BO0Zia3fB10FNbGDlmpW61E65f6
 oHveso7lJDjUIQHZq0fypC2KA4AerhjIGukl9oeXxKAeZdmscl2XHFTShaUHACSEy6rGiq5f9jX
 InTmVCEkzeWx8zwYRqefMcp2I2g7dZls4qEMBJH6e6xn0GSymQ8PPt67BxMDxaLa/oJpAYz97U0
 mPd0gGpXcQZyADNNhiUzgqcgfWvLKhGFd0oSVJJ7AhbFTREgAWEe1tFgj9Qddwp9Z1bsFaWtgy4
 Y9zRk5Up98NiEUQmYDI5srTm/4zIW/J1Oc/FfM3ZUtxx/P+/fOP6bmg9nVuLeUx6aKsIxRa9u6+
 dg0u+Fpu6sXyHOoBG7WVB5Y78Mpqsox9BsjJYUOt0UTc/7k80c9K/nnUz96yktiNWS+b3Z20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_04,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=959 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270064

On Tue, May 27, 2025 at 1:28=E2=80=AFAM Richard Acayan <mailingradian@gmail=
.com> wrote:
>
> The libcamera plugin for Pipewire may keep an open file descriptor to
> the video device, even while streaming. This simplifies its operation,
> as it only needs to keep track of a number instead of a file path. When
> the video device is open but not streaming, the pipeline can be powered
> off. Move the pipeline power management to the prepare_streaming and
> unprepare_streaming functions.

It seems to affect more than just this specific driver then? According
to the documentation in v4l2-mc.h, v4l2_pipeline_pm_get() is intended
to be called during video node open. If we're changing that behavior,
we should also update the function's documentation accordingly so the
change can be properly discussed and understood by a broader audience.


>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../media/platform/qcom/camss/camss-video.c   | 39 ++++++++++++-------
>  1 file changed, 25 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index aa021fd5e123..8d05802d1735 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -225,6 +225,21 @@ static int video_check_format(struct camss_video *vi=
deo)
>         return 0;
>  }
>
> +static int video_prepare_streaming(struct vb2_queue *q)
> +{
> +       struct camss_video *video =3D vb2_get_drv_priv(q);
> +       struct video_device *vdev =3D &video->vdev;
> +       int ret;
> +
> +       ret =3D v4l2_pipeline_pm_get(&vdev->entity);
> +       if (ret < 0) {
> +               dev_err(video->camss->dev, "Failed to power up pipeline: =
%d\n",
> +                       ret);
> +       }
> +
> +       return ret;
> +}
> +
>  static int video_start_streaming(struct vb2_queue *q, unsigned int count=
)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
> @@ -308,13 +323,23 @@ static void video_stop_streaming(struct vb2_queue *=
q)
>         video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
>  }
>
> +static void video_unprepare_streaming(struct vb2_queue *q)
> +{
> +       struct camss_video *video =3D vb2_get_drv_priv(q);
> +       struct video_device *vdev =3D &video->vdev;
> +
> +       v4l2_pipeline_pm_put(&vdev->entity);
> +}
> +
>  static const struct vb2_ops msm_video_vb2_q_ops =3D {
>         .queue_setup     =3D video_queue_setup,
>         .buf_init        =3D video_buf_init,
>         .buf_prepare     =3D video_buf_prepare,
>         .buf_queue       =3D video_buf_queue,
> +       .prepare_streaming =3D video_prepare_streaming,
>         .start_streaming =3D video_start_streaming,
>         .stop_streaming  =3D video_stop_streaming,
> +       .unprepare_streaming =3D video_unprepare_streaming,
>  };
>
>  /* ---------------------------------------------------------------------=
--------
> @@ -599,20 +624,10 @@ static int video_open(struct file *file)
>
>         file->private_data =3D vfh;
>
> -       ret =3D v4l2_pipeline_pm_get(&vdev->entity);
> -       if (ret < 0) {
> -               dev_err(video->camss->dev, "Failed to power up pipeline: =
%d\n",
> -                       ret);
> -               goto error_pm_use;
> -       }
> -
>         mutex_unlock(&video->lock);
>
>         return 0;
>
> -error_pm_use:
> -       v4l2_fh_release(file);
> -
>  error_alloc:
>         mutex_unlock(&video->lock);
>
> @@ -621,12 +636,8 @@ static int video_open(struct file *file)
>
>  static int video_release(struct file *file)
>  {
> -       struct video_device *vdev =3D video_devdata(file);
> -
>         vb2_fop_release(file);
>
> -       v4l2_pipeline_pm_put(&vdev->entity);
> -
>         file->private_data =3D NULL;
>
>         return 0;
> --
> 2.49.0
>
>

