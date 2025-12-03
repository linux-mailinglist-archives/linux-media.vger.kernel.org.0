Return-Path: <linux-media+bounces-48143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 72820C9E9F0
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 11:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C136A349945
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 10:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8329F2E6CC3;
	Wed,  3 Dec 2025 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lu+/qV1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLz9MksL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E792D062A
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764756059; cv=none; b=USkcP4pJryuq6vlvRIUGiDy62cVQPPcvjCqDl4noLtw3NnCJWai6+D2qEB8sh2Uy8MuNI15SsGFANiy3Ve2wxU8OmtXeCIP0/ja5BtpXxZrn3jSA4OSYfd9n92tPxslWn5VVgiQlg2JfxROFU+jHD0YzDPMd3xhWtAOPIkRYHMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764756059; c=relaxed/simple;
	bh=cPfa/gPVnjQwhwX1zjDzSsjrR0ofZWs3Z13WOsxGQVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxHkexHjBhIgYayngO+3sQu2asr3j1Aa0U3qnrhmhw/t1Kw9m4AnbobEKX76od8l7Ccrtn4yNgx9KlU3IQRDo52MvgKirHYYEiJggeLdQHSQeLDfs2drdRIKM3U6aKFMy8+QZOG+KzgOY0Xs3WV3huhhc9xp7e6LhvH1dCzlpig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lu+/qV1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLz9MksL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34EgaJ1428784
	for <linux-media@vger.kernel.org>; Wed, 3 Dec 2025 10:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9vb6nLHl9jv/CKWdouRDWsbD1SoT2Kye3kJmluOu4bA=; b=Lu+/qV1KWrQ/wH7W
	XuRiY+K6/OAK2LcYQ2nt63+Le4SJxBULFXSwDYMgbC2+DzT86TKci3BeA4wRfw8U
	g/6lrtaTkXR3ma2rGFrsXeCrBSFi+m8bKfLG8ajy7prDcQQYjk3t2apyK4dmZEuO
	wddvrOPgHOrrf09qJtsUeAEvX6YLKPVwn5LTCm74Y2aHEMsyuRpVejXeSG1dlah4
	6yDn9A5xMkVzXXi1sggG8FsEeDt4/fi90VRY+xmQI9nGVRmij0S9HtMuGAlhVECE
	im9EK8gJ6ledKuGlMNe+fiMhlatKYIfF3di3wNWrvWJ6IINU5SVQOf9YSd/FtNj3
	KkKGeg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ate0js366-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 10:00:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8846cb0b8afso180470246d6.0
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 02:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764756056; x=1765360856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vb6nLHl9jv/CKWdouRDWsbD1SoT2Kye3kJmluOu4bA=;
        b=MLz9MksLvXCohLlDsjA9LOtL/i4+DbgQDqKvDK1NsuRo5z/3utK7XrFc6G0L/INGAk
         UsuHwbwPerYijuYTt0GC12m64b2Cw/YpJNjRg1Ir/wL29uYn92Dmbhp3L30tIqF4Y9RK
         Bt7LXylFPEWvYqg9UKgbpOWvOmmhKo7JVN0VDpEMLqPGo8sFVpvsaL2f744sTbN44WuT
         Sc/ImBQMx2u+q75vkQroZafb24tCJhriNHAxAFTW/0x72imbiguhi0Rltwd/uU6BLZ7r
         6tj+BgSbFlANLRdYSzsaeY3hAqA62k1DvCmQQJvPGADH3YrxEetieetkNbr8hUsQE0h9
         ajsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764756056; x=1765360856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9vb6nLHl9jv/CKWdouRDWsbD1SoT2Kye3kJmluOu4bA=;
        b=KCZzVDRgj+i4rpdKNHXFzX6o2/KNkUlcTmNX8dEMfBSym8CNtCsssVSEO9KlrHCXTb
         YCsq/i6BRn4vqttubn5t7VV54yENpGJSPT3B6VLXoL5QBXvrxY0zydMaSRg3JgBcetBx
         nF5QEKoFINa9j7618U0O3fcq2SvCWsZZbuMzwkoSqZOHlwdj24I45UJZ4FgVCBVWUPRb
         YTFXweZNdlD4zjQBhJpiX4jl+SPFYoJPeKGk/SBv7flequ+DZHd+XAosYuBmm396vSiP
         rqSZfRgDRJ0fHiEGk2SB0iQC/2Xff2SwlyIoLGafiQE0s77rUjYcAj1Ow4yx/oZ1Xsmp
         GtMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC4sozJHCqvcEjjRG2RymPPyNjpxWlcYuZY6ZbsczYyHgCYu7n31Zwz9DAowXEB4kr3sGYQKVHEHwI0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoO2K02WX6Qzqj9DLGrl79brGL0387EJoD4DPReAjsiIrlanzP
	CoAV0essgQJMgTa2HFk2ULIzwXn1cDy+0sa+zsyCQN75s++rvoV57Vjg/jCYqbG74+gEAe48zsY
	lza8upXz8GDaJ1IT78CVnP/mZnHs8B8Lhxg5B7afmilThi/Iwnj3Wpf0JRdSwTcbl5cCd1p3Uto
	TYYnqq80eCXJFi+kK81yGELubzzEdihKbif1Oth7Is
X-Gm-Gg: ASbGncv6tnSmZXUUlHFWko7ulJjhvK1udduKE1s0noIUI0KIj1rTD5hs2mf/nHhep0m
	ZZdBatVmSCQZkdS+HQPFJwJrzLGFV2ETBVEIExynkz2nphoQWqx6Cbzx+oIp6cJf4v1WUc0MfAd
	rUmKPP2ePJC7x2ceGdZn8+BRWbOd9s2ZLJbF8bPx7p2gkTDmAxWFdp1xvHFn6Q3hsq0Y2O4ae5i
	igFRMrFbpVtEo3ckTguj4XsGM0=
X-Received: by 2002:a05:6214:5687:b0:87b:f369:35d2 with SMTP id 6a1803df08f44-88819589005mr18384236d6.39.1764756056187;
        Wed, 03 Dec 2025 02:00:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzFiJWchbuRF50Ht6AeNZ2DSTLZHKXmvxugZAtNJOcgrvKIBWrysaB495LbANaZu1vZzJoQAqh+PmnDJJON5M=
X-Received: by 2002:a05:6214:5687:b0:87b:f369:35d2 with SMTP id
 6a1803df08f44-88819589005mr18383546d6.39.1764756055633; Wed, 03 Dec 2025
 02:00:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com> <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
In-Reply-To: <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 11:00:43 +0100
X-Gm-Features: AWmQ_bkHfo8sietxEdBct9crfYv3t0yfWoNgbwZ482uTbUp-BloVJD00f4sEG5k
Message-ID: <CAFEp6-1zoU2cfVU06MoeOtAwMYN+XAxCwc0ebwaQyo78VNBf2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3OSBTYWx0ZWRfX9U3OjowFYMSQ
 McQBO9IcRYIokCNF1GQUQVWrrClJ2TsHJihhTM56E1G7fP/th1+czNHVDJ5bTsRjzWb7/nYnqo3
 ryhf86cgmmsRaZr9BocippWJSyBUjYDMPkptdsZnEWGriXRasT0w4zCkONvmxpRb5FfYCgrdqF1
 Pw3S2v13S39KnNBJxXRoFIShF3fdQO7vwjwNH8QQpptZZ7yBJAw0Y6WWDd4gH0OcD0WyBam+2yj
 C4ES5eV9gJSK2dfjP30kwZtgrkpp+0mOMlmvocYxNk/DhokJ6uILgkcTazAE5ofyyHRSvA2kRXg
 Noh0bGeoZza2AQFPvPZjQHAgdTpMFkJLwRhaFMxIGdl3cIYeGUXBdfpwKVACEPwdwOpBf4NCGEF
 pqbYye+dwwb7fEHqqu2mSlcUqGsczw==
X-Proofpoint-GUID: _VJiwrJIEcbbJfAeqpTwuokGyIr37ClJ
X-Authority-Analysis: v=2.4 cv=cOHtc1eN c=1 sm=1 tr=0 ts=69300a58 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=sUzC4GSqm1tOj9JvITsA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: _VJiwrJIEcbbJfAeqpTwuokGyIr37ClJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030079

Hi Laurent,

On Mon, Nov 17, 2025 at 6:30=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Loic,
>
> On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
> > Ensure reset state is low in the power-on state and high in the
> > power-off state (assert reset). Note that the polarity is abstracted
> > by the GPIO subsystem, so the logic level reflects the intended reset
> > behavior.
>
> That's an interesting approach to fix DTS gone systematically wrong.
>
> I was thinking of the drivers that have this issue, too, but I would have
> introduced a new GPIO under a different name (many sensors use "enable",
> too). Any thoughts?
>
> Cc Laurent.

Do you have any feedback on this change?

>
> >
> > To maintain backward compatibility with DTS files that use an incorrect
> > flag, we implement a mechanism similar to:
> >   commit 738455858a2d ("ASoC: codecs: wsa881x: Use proper shutdown GPIO=
 polarity")
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 26 ++++++++++++++++++++++----
> >  1 file changed, 22 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index a9f6176e9729..e79b326cdd94 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -160,6 +160,7 @@ struct ov9282_mode {
> >   * @sd: V4L2 sub-device
> >   * @pad: Media pad. Only one pad supported
> >   * @reset_gpio: Sensor reset gpio
> > + * @reset_gpio_val: Logical value to reset the sensor
> >   * @inclk: Sensor input clock
> >   * @supplies: Regulator supplies for the sensor
> >   * @ctrl_handler: V4L2 control handler
> > @@ -180,6 +181,7 @@ struct ov9282 {
> >       struct v4l2_subdev sd;
> >       struct media_pad pad;
> >       struct gpio_desc *reset_gpio;
> > +     unsigned int reset_gpio_val;
> >       struct clk *inclk;
> >       struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
> >       struct v4l2_ctrl_handler ctrl_handler;
> > @@ -1127,13 +1129,29 @@ static int ov9282_parse_hw_config(struct ov9282=
 *ov9282)
> >
> >       /* Request optional reset pin */
> >       ov9282->reset_gpio =3D devm_gpiod_get_optional(ov9282->dev, "rese=
t",
> > -                                                  GPIOD_OUT_LOW);
> > +                                                  GPIOD_OUT_HIGH);
> >       if (IS_ERR(ov9282->reset_gpio)) {
> >               dev_err(ov9282->dev, "failed to get reset gpio %ld",
> >                       PTR_ERR(ov9282->reset_gpio));
> >               return PTR_ERR(ov9282->reset_gpio);
> >       }
> >
> > +     /*
> > +      * Backwards compatibility work-around.
> > +      *
> > +      * The reset GPIO is active-low, but the driver has always used t=
he
> > +      * gpiod API with inverted logic. As a result, the DTS had to
> > +      * incorrectly mark the GPIO as active-high to compensate for thi=
s
> > +      * behavior. Changing the flag in the driver now would break back=
ward
> > +      * compatibility with existing DTS configurations. To address thi=
s,
> > +      * we add a simple value inversion so the driver works with both =
old
> > +      * and new DTS.
> > +      */
> > +     ov9282->reset_gpio_val =3D gpiod_is_active_low(ov9282->reset_gpio=
);
> > +     if (!ov9282->reset_gpio_val)
> > +             dev_warn(ov9282->dev, "Using ACTIVE_HIGH for reset GPIO. =
Your DTB might be outdated\n");
> > +     gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_v=
al);
> > +
> >       /* Get sensor input clock */
> >       ov9282->inclk =3D devm_v4l2_sensor_clk_get(ov9282->dev, NULL);
> >       if (IS_ERR(ov9282->inclk))
> > @@ -1237,7 +1255,7 @@ static int ov9282_power_on(struct device *dev)
> >
> >       usleep_range(400, 600);
> >
> > -     gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
> > +     gpiod_set_value_cansleep(ov9282->reset_gpio, !ov9282->reset_gpio_=
val);
> >
> >       ret =3D clk_prepare_enable(ov9282->inclk);
> >       if (ret) {
> > @@ -1260,7 +1278,7 @@ static int ov9282_power_on(struct device *dev)
> >  error_clk:
> >       clk_disable_unprepare(ov9282->inclk);
> >  error_reset:
> > -     gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> > +     gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_v=
al);
> >
> >       regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
> >
> > @@ -1278,7 +1296,7 @@ static int ov9282_power_off(struct device *dev)
> >       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> >       struct ov9282 *ov9282 =3D to_ov9282(sd);
> >
> > -     gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> > +     gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_v=
al);
> >
> >       clk_disable_unprepare(ov9282->inclk);
> >
>
> --
> Kind regards,
>
> Sakari Ailus

