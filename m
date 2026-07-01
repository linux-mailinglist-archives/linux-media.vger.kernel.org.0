Return-Path: <linux-media+bounces-66227-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P36WGIcbRWqA7AoAu9opvQ
	(envelope-from <linux-media+bounces-66227-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 15:52:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D80C6EE5EA
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 15:52:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=maUGJmTP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cTdHP2wS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66227-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66227-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86F69305BCB7
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 13:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069D42517A5;
	Wed,  1 Jul 2026 13:50:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5F023D7DC
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 13:50:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913805; cv=none; b=bYyfG4wpZJf+JRYBtxGt8I0xnajoWD0MqJ+mSARlDDpZQoqKqtjTzUqXDY2Iv1j9vXQFo9kjkvRA7alkfzEPK1Rs4XI6JSqvT2JATtygOUYqgGxkhENcNXkEuaWV6qMOEbXpQXUROiK04dDUVGykp61nB7ZcCbj26fwr2enwiVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913805; c=relaxed/simple;
	bh=acgn6OY70PK+qOnh+hja4mnXsBwLNuTNt6VOTalVy80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOjIl+zb8JjBQwqJErKu0CiollZVcjSaGcjTUOb1gKPXCuu+B51dMXQJ365RKLcidA3eLldWHtEZoFs3sOZmqGtChVpZ6fp1xxcM5Wu3aX0wRtBu5XJTC9lAR0hp8ZUHe0K2wlNcp+O+UmyJs5W3+cBObMmfqLWLbzIzJ7k7ZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maUGJmTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTdHP2wS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8hIS744622
	for <linux-media@vger.kernel.org>; Wed, 1 Jul 2026 13:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LvOIcF50K+uIfBJyPv/IJnwM
	Hx6DqiGFCP+s763et0s=; b=maUGJmTPZpvMmksY7ngZPTuq8RVPf6nZ/zNeiZUk
	z2k5EhjfGaGOp3Ouz7kJx25B5wHJ5eZ+MZ+cB5fdpBuWBWNPySKBm/Pqx/ock9Xs
	SEQbZsgdmKFrCCDILIRiy6tOe6RQqZjsIDbIYWW6zWaz9T0V1NZk4hRfVa+rTpUQ
	9TzyFGdJ4Ql6mIxmIRL7OLnGZlsmsZAxohpOhihUe7jZ/k2I6KTdTe4C37mHJnwP
	X2IlIll/7ryIAMVYfklDNo04aevopsjmpbpu5OKCk7mVDfpdUKPzzu73NzE27tIX
	vRPlauj/Pv3UWWFdgCOs1fB4VNVF2C0BZkKf87MfNpT6ig==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0thst7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 13:50:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96910ded42cso136807241.1
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782913802; x=1783518602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LvOIcF50K+uIfBJyPv/IJnwMHx6DqiGFCP+s763et0s=;
        b=cTdHP2wSALOEerkBE1X2YwVApoWBBRx2LnoXvdVUYcyXF401fDWQYhqZx6j3LCGsh9
         WyWH6htYcf0tDtJzsdItGNDDMpEjO+3meySjPE5q4Qm4z9l616RzK+OVTSi2ta/Xo04V
         +xD5QN4+HPw9pIHA4KPRAk3dR1rH0kICNcTBHhAEzlnE/5UEp+GQOh8TbEzLsP4FmkwP
         ZWJRyDcMrvhSqnjARoSGm0IzLmTR6veNjHPc/cIqzh62q5di1wo38gdI7usL+MAR5d+E
         VGCJDg/pksuAIFlQBoH9JSLfuhyvanWxdGLjb61O9QAMHpH2AU8cRZ5r69Rf2R3UCJ/X
         oIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913802; x=1783518602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvOIcF50K+uIfBJyPv/IJnwMHx6DqiGFCP+s763et0s=;
        b=fxSBIyQaOQ52G7XJZWNDwz7gkFjWheE/ZMFvxT5RkRl4fQ3j6gI3rYuUf7ux4jqBfV
         +/Bar4lI8kh/CmeVr18v9JUMg/eOjylAE+qA3GknVPcq+IWTja2hJ5KgN9qXnceVPhQd
         nr7tgxC0weL8XrEd6JhQF+SPAQpxPh5TDXYclJ3C/8Bq32bzndCvRCU2bukm6kWNxnMf
         XWO+k8MB6It6ee60ADtQ4p1IZJeaNqEYcXL/BzAw200QhaPD7aq06QC/20CS8mcF8F7z
         JDjXSZy3xlfzMscYZ90gNbE9bXdgrhAdxqne8lEx56y+6tBlR2lEdP5bpRCquhZSDzad
         Mfmg==
X-Forwarded-Encrypted: i=1; AHgh+RpMYzzMxNr0GLz3OGZXIn/wRd6TytZWg3GGmzYdG3pO5yDpU70sY/1KkqDno/Ujc+OlBSHHC9QBvWEi7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYFmNGejSsLAGGQuRdSSCRsThbRnr/Y2r9Jx8rPDkL+8ICw7Yk
	lad0cqjo/kjnOZvNKZ0mumD8tTwSq73XnXSjl0TYMGKmyZc7M+wX63khJRah6H0LKSu1KGrtm5n
	USnFiTsDSIAi3HYJL9GaDLwHpXECumI1HHL/v0F/AD+OVPjUqFjDc8E9saxTllsMXwQ==
X-Gm-Gg: AfdE7cnAANQ0QZDeJ50bMI/7cqo1OFp3O2RCJmi1jaSs0F44lIbp/LVTbRBV7CG71jV
	AWF+3s0KOFNyHexiQfiIRYjXL2yiryeme6WKAOvWKU0lPGOVcYRAlt0X3PtJzlo5cBD3mINR6jD
	w/XtjXG1Zn5L96O30b0yk+o3K9egr+3ZZuuzWwngdkarvhSnDwYSiTvXTjeMqH6kCZtNFZYRVPU
	8wClYaBw4nHNhbSOfBa/KfLItsNcxA6ntTk/MuD1VV7epua1Z5BWdRkcNngmJiaS3+jMaPVGrwL
	jTu70k9Je3C/rUrzZ0G9N/zwHhgOmSN1CYXnbIQWAi/2RRH6uel2s3qY+n91jYnPvKKkD5UbfbU
	im6ICYOtEOcXvO/COmlgpfIXVMOkEdyOSY6/OUDMGitPjW7YLH6VXefln9ztN0/S4AJS1HbS0WU
	fMpWPC4dj8Amtd/5vJtUCydpCY
X-Received: by 2002:a05:6102:f87:b0:738:ff1b:942 with SMTP id ada2fe7eead31-73daa9bb6c7mr586071137.22.1782913801361;
        Wed, 01 Jul 2026 06:50:01 -0700 (PDT)
X-Received: by 2002:a05:6102:f87:b0:738:ff1b:942 with SMTP id ada2fe7eead31-73daa9bb6c7mr586044137.22.1782913800877;
        Wed, 01 Jul 2026 06:50:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe49855fsm1248078e87.44.2026.07.01.06.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:49:59 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:49:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v5 13/16] media: iris: Introduce buffer size calculations
 for AR50LT
Message-ID: <jzqblo74y775tml2zwj6lfwcij635wkjivegfccx7peg4m6gne@cgu2leollht3>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
 <09f6f0bd-6bde-4dbf-9be7-623c17232b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09f6f0bd-6bde-4dbf-9be7-623c17232b16@oss.qualcomm.com>
X-Proofpoint-GUID: aNGVraAYMgy0GgBm19KkhMot2W7Fu-43
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX8lMVSEUV1FGG
 IiF130zqzW3hE2APMWxu0ivQfxxbQEp01gVSC5cGr9KeUO5EQ7EIHe/Xg9FN623SunCsEsD/PJd
 kbQdIa+eWgJvar45xnGa0Ja3GFGJgBk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX/09gzUi7cSLj
 bd+dnfPqZPp1XA/wsz4UPljZzuEbDHMJR+pccZPpqQwfYsuVOcb06UzFPdD9AaZKoaLXmvqiF4S
 oxARM6LgkKvhqP+nLlE7ta8Ok3fs+yGBCOuyDvhUupWPva6Jdt5pbKnWo+cU1cDaC9Nlz9O9vBg
 3AJZmUh/lBefrjUaf3aR6nbDniaHNUgV9Dc6AN3Yma4FUSQP0nSKIWBS6n6bOnd862EWJ7rM+7t
 LD9FvlWI5ZwOqQ0weTd2Ka43YuDfBqsl7K2JQzy796jdWOzlVVvyssQfem33BMhmrOr6/hKV3sO
 K3R8Dt9W6VgPyviQ5N91M6Bl6OT+VPkCvpqHrPaYS5OXU28jFKkiwNz8kqhQ9/8++mBlkk1+Abv
 naYYCQB3H0EyLXKrYVYyvUHeCscfDxjDO1BjvIHFcJd/krqxMj6spFNkNTlJAh74ZwOwN4nMc8p
 En4fZnFfuumsSAGhbtA==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a451b0a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DNt0h2T3mK1VvZeRrVoA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: aNGVraAYMgy0GgBm19KkhMot2W7Fu-43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66227-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D80C6EE5EA

On Wed, Jun 24, 2026 at 08:40:02PM +0530, Vikash Garodia wrote:
> 
> 
> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> > From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > 
> > Introduces AR50LT  buffer size calculation for both encoder and
> > decoder. Reuse the buffer size calculation which are common, while
> > adding the AR50LT specific ones separately.
> > 
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 401 +++++++++++++++++++++
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 ++
> >   2 files changed, 438 insertions(+)
> > 
> > @@ -507,6 +734,13 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
> >   	return _lb_size + vpss_lb_size + 4096;
> >   }
> > +static inline
> > +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min,
> > +				bool is_opb, u32 num_vpp_pipes)
> > +{
> > +	return hfi_ar50lt_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);
> 
> pls keep same name across like "hfi_buffer_line_vp9d_ar50lt" and
> "hfi_ar50lt_vp9d_lb_size" or combine these 2 apis, as the one just calls the
> other.

I think, Sashiko pointout a different issue here. Should I be calling
size_vpss_lb() to take is_opb into account?

> 
> > +}
> > +
> >   static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
> >   				 bool is_opb, u32 num_vpp_pipes)
> >   {

-- 
With best wishes
Dmitry

