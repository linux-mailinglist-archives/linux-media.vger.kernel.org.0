Return-Path: <linux-media+bounces-56060-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Js5FWdIuWmK+QEAu9opvQ
	(envelope-from <linux-media+bounces-56060-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:26:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A21602A9D4A
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25702304AC1F
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD3C3C1985;
	Tue, 17 Mar 2026 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTjjyztc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IdL0RzwA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CA23C1961
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750302; cv=none; b=PZ7TsHgtiZohoHKQn8j7O2v6CTYz1cbwNWQF1E4nxozCgejS4lPUkE9AbsDVxLHxbnDiDvErn8rpPFwefjqd2LIMpzwKLt1TGDxF7pbVRqyJgvT6s/uAZC+rFzsuJ9bn50cGF8mQnC6mPDQ9jSgpO6XYeqPC0DYZSJfPKw8isf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750302; c=relaxed/simple;
	bh=YwSIm6+kexwJepl6Yf8/Smn9UpseQunFFfXJQGTKT3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s59ekg0vyRePyR83udWeRQPnPSr7IYSb63vgBu5a4mgcYZN04Jax7XFCZGCD37/KkVJ3XBJlHcSkmjKijSZmwfdSWUVZUulX9vrrY1LF5pWgWrwrcYw29l5DdpiqJ0rthL9IqlX5rEpGrzN3uOAPlmUe3U5D0D2yb0b/MeRoJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTjjyztc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IdL0RzwA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HA3JRm2072254
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lt2XPVPZjVV9AEhhW0NEp+RwyFrJ+wodr2Juckp1GTU=; b=bTjjyztcalDiloil
	Zh4GHW2a9FVfSbjh0ac9zoj53ePuLfE3ZMrNqGDQA/WUK6kEL4XojWRUuI6OfmJn
	k7nxznkrLNNOskK+ghl8OViCD48vSpffSJKXiLtB+J3PYuHbCbDuz6/pFf2IrHsM
	Upta4B51cCFusn6uKF69X9aQaSMJcCpGr47DAN8WIlv7fx3wR55OGP4nPiLOvUvJ
	On08l2zdyp66fFZLQBtStW1s9DU7O4/t9LKosDovBgFWeUqA23Mj4TJILxPntgyc
	4DW8MkkDm3q+BF/lMt8KilfBkxWnfimeGbXdnmQEnbkZslvZRd8zT3rQIuhmsSHK
	OsKq2g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6re80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:25:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd84943c76so483751185a.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773750299; x=1774355099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lt2XPVPZjVV9AEhhW0NEp+RwyFrJ+wodr2Juckp1GTU=;
        b=IdL0RzwAJAfqXPMsj6dmSLDOsbIOLwPTSwVX2GTZTqbp2St2tVKW7/XJsJqjyqY15k
         Q5roCnglTTCsgTG2hb4RyydFcHfZovr8u1Do8YCX+glEBZadNerAQAypGfqlQMbL7LeU
         +aScz3OvdgVURQwrGVJQRjBvdbXdkHPCMkg31a2eRw7q2UYAzYXgn7bxMeCGxg48VJdi
         78CiC26ltCu9RFmxDQ1OuBd6ZDNyPS7mz9yhP1C8Fg+JlSa+ixXlbDWcxVpGUVsJongg
         jWCEe8XL/B77HQaImo++/uYsACS6MMqbUEWVCskojxJ1gJLUDefcF1gZDzQePssRrcLR
         8lFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750299; x=1774355099;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lt2XPVPZjVV9AEhhW0NEp+RwyFrJ+wodr2Juckp1GTU=;
        b=NSQmR46cAGYKvY0Z86EEoLIllK+URmzMPkD/yC3dmwmV3HWFCEx9ZkSxTpLRSwUw98
         qZOBwfBJ9VzbznYYloUZAdJQrgX+ytIx/ttmDooMQxdya9UvvDKixo6XZdJem0cVrwO+
         +2QxwrP7znE9k2kpkY9U/zJeinoYwh0mdngXo2rxlL3/pzRrTJukb+byF+uKQNUXOeG0
         HT5Uuxb6CBEMJaWyda0d/5Hc5i41ZWtv5c5IcQwHmeu8UsVOBTm82JOkK+wkM0xeHDUf
         5muN/BtRPd5qPUCH2l6rAAeG7tMvPwTkp6KX3NaIFdM9sbZBBVHK7srM2QCM3Jp638xq
         SSiw==
X-Forwarded-Encrypted: i=1; AJvYcCXCrocgYLrCrij58IfwueuhCz8DKtdDC/GkdA5Z3f4uOhsJnju7jDnwBU6c4oUgj0tpG5/mjlE+wnKO6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YznNjmwtiBr0wt7TJ4rBDjFSx7bNP7/fzvkMhNObz/wqckoDJ3f
	sd1qoaFcVnIBQNK9Mb0d8RBBC+TdB3eCVOOz9GGjISqdJsDf4ZRzrn4w05Aj6Z4CBI3NRSBH8LX
	ovbaZ7q04dxQxCDIsqJgKBTAvvzwPRSPHpkye1YTeE7E0JlUEaAa50tlr9q4xLj2MaA==
X-Gm-Gg: ATEYQzz0uQCrm2TuPbLincpITIiFI+ff/klE7pVCWc43IiC9zkMrDqOd1TCu4cK0nE6
	MKdEKykUuVrXYpse0epUGKcCWf+xcoarzusdDNwYFBXnc11RJz5erpKdp6cDmT+m4iRtHllaY2r
	DNK0LNEnOZu4+2H+GfAyih5CXdMOU0623ivtBWDtcuMNxJa72Hh64gEK+FKYP1cbwD0QxBEL2+C
	h9Ok7loB349c+1m8RdYMTlOP0BZuHzFuEah8zjPvBSpTe9CXR5AbJB/zxIsgGloEbIJkmOF6zUE
	E2TRlzG74/QvOe9ZlQRJdMhr3XYjezsgCEbcZClwU/puecF1tlMxKSvT8Oa3qfX8a0Xs5vYvX/R
	h3Q6xzwMIWH9vpRc/bvSVSL9f6RmYXgbFqyHf0Qf77IPugB96fmUsL6MmFQVnHfik72aU57/TDE
	/BBAAYm9Ps5wECuBjIlfMXPDiW6HaVgFsfdN62itPTdYFcJvkJOqn8JnJwlq3OSUiVMbFRmDqOh
	RidgF8DzS3QeHcQ
X-Received: by 2002:a05:620a:6cc5:b0:8cd:7cea:aea0 with SMTP id af79cd13be357-8cde1533e68mr371324785a.39.1773750299330;
        Tue, 17 Mar 2026 05:24:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:8cd:7cea:aea0 with SMTP id af79cd13be357-8cde1533e68mr371321185a.39.1773750298847;
        Tue, 17 Mar 2026 05:24:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66794e48a92sm59136a12.28.2026.03.17.05.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 05:24:57 -0700 (PDT)
Message-ID: <a3f89715-b937-4858-9a44-8d8d634cf97a@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:24:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v11] media: Add t4ka3 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
References: <20260316085704.352669-1-hpa@redhat.com>
 <abh9evUPzozh40k-@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <abh9evUPzozh40k-@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _w9IS7G2SsHErYjErPXBP_vTrF-Jdy03
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b9481c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=sLlAhtP-nh0cMpve25QA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _w9IS7G2SsHErYjErPXBP_vTrF-Jdy03
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwOSBTYWx0ZWRfX1v0U5V3tQVY7
 aVxEc0MVGn7yG8IetdC9lg9jOsx2jBx70pFLsrRgsR5UFgohHWRkxwxsBpLW31sRS/dTTWZa9Je
 NIcjxHcAnFcTuxcF/S0rPCONnUuC1SKkdxjSr4YWrteJ3CyJrfv6JsV/q7FBI9wsTsBuElq92/1
 ZIFeVxdPGfMby8pfcVgg/kRAVa5RTMOMuFO4XoBqwDfMFb3F/FGD+c2K6p36vjdEcXo132cLX8b
 nM7smV0AxAfm83ydXNJuAT8q8f32rDcgttrAFkMkOfNl0YKoBsHZqBF4n7zGHAbi4QaeqrNFFTY
 ibHwzERHOKUJtQqcvTvUt28H2EWMFauxx810s6t/E91BmtTdIVipc7CttUDcpNkfAXk7Zvlluij
 eevIBrFtO097mDqhs/n/8LIC2QjytuVgRtuwyXFKyHiNgiaAfGtUkbv9Kkpisudt4lYJcSIQ1wz
 QAs8tmyY6Uzd6kPYYBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170109
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-56060-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A21602A9D4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On 16-Mar-26 23:00, Sakari Ailus wrote:

<snip>

>> diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
>> new file mode 100644
>> index 000000000000..d9af5e51f7a8
>> --- /dev/null
>> +++ b/drivers/media/i2c/t4ka3.c

<snip>

>> +static struct v4l2_mbus_framefmt *t4ka3_get_active_format(struct t4ka3_data *sensor)
>> +{
>> +	struct v4l2_subdev_state *active_state =
>> +		v4l2_subdev_get_locked_active_state(&sensor->sd);
>> +
>> +	return v4l2_subdev_state_get_format(active_state, 0);
>> +}
>> +
>> +static struct v4l2_rect *t4ka3_get_active_crop(struct t4ka3_data *sensor)
>> +{
>> +	struct v4l2_subdev_state *active_state =
>> +		v4l2_subdev_get_locked_active_state(&sensor->sd);
>> +
>> +	return v4l2_subdev_state_get_crop(active_state, 0);
> 
> Please avoid adding such helpers.

The problem is that we need to know the active-fmt/-crop in some places
without access to it. E.g. when the vblank ctrl gets set this influences
the range of the exposure control, so we need active_fmt.height to
calculate the values to pass to v4l2_ctrl_modify_range() and we need
this from a v4l2_ctrl_ops.s_ctrl callback which does not get passed
in the (active) fmt.

Since the ctrl lock is used as the main sensor-driver lock too, 
we can always safely call v4l2_subdev_get_locked_active_state()
in these cases, since we are always holding the lock.

The alternative would be to store a copy of the active fmt/crop
inside struct t4ka3_data, but I thought that the whole direction
for sensor drivers was to stop having (and needing to update) their
own shadow copy of the active_state and instead direct use
the active_state ?

<snip>

>> +static int t4ka3_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct t4ka3_data *sensor = ctrl_to_t4ka3(ctrl);
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	int ret;
>> +
>> +	/* Update exposure range on vblank changes */
>> +	if (ctrl->id == V4L2_CID_VBLANK) {
>> +		ret = t4ka3_update_exposure_range(sensor);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	fmt = t4ka3_get_active_format(sensor);
> 
> You could assign this in declaration.
> 
>> +
>> +	/* Only apply changes to the controls if the device is powered up */
>> +	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
>> +		t4ka3_set_bayer_order(sensor, fmt);
> 
> Does this call belong here?

Yes, if the hflip/vflip controls change then fmt->code needs to be
updated to the now changed bayer-order. t4ka3_set_bayer_order()
uses the cached ctrl->val values so it is cheap enough to
always do this instead of checking if the changed ctrl is
vflip or hflip.

In case the sensor is actually streaming and we don't hit this path,
the t4ka3_t_vflip()helper will return -EBUSY since changing
the active fmt while streaming is not a good idea.

Looking at this again, I do think that: t4ka3_t_vflip() should
be renamed to t4ka3_update_hvflip() because the current name
is weird.

Regards,

Hans



