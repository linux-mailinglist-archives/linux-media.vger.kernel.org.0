Return-Path: <linux-media+bounces-58592-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNJKGeKA2mlC3QgAu9opvQ
	(envelope-from <linux-media+bounces-58592-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 19:12:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4D43E0F8D
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 19:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0AA1306AA5A
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 17:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6052E3B9608;
	Sat, 11 Apr 2026 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSy8I1GR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFY7Qmo1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E00F1A275
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 17:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775927451; cv=none; b=tD0HaqYzbqbZ28G3MzeYU3Ls5tA424tDA5QjbfapIvblz+L9PUo77uVG2m75G+ZCTF6J5FIdrZDo8bxNbcZMl9y+ZUTgtivnIGQxPcBlV4jqrJ9e4Wa8oXKF6IPHtS0UiMnETA12kb2Pp1ZKyAOvtGvIgXMstN7UJ8I0DFBiOO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775927451; c=relaxed/simple;
	bh=GA1bi/Nl4FCTnvtyGgMqfY0giYa5H9BIz9GZFJeNdjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t951CYDG1eOh9+7qsTuGKF7chJLamvI/dMOmADznP6BdyPNJd0dWFVBMFWRT2cDu5AsXUk2+i+3koBZPgVVPRYr9+63LGw8FrQWxWOaRja+Uj59LeU5GKsCX9h1mtucl1riqVq6EFtsy/jkWXC1HK1KG24FNU4Qp4w9NY0IhAWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSy8I1GR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFY7Qmo1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B46RCv2624906
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 17:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7fOy5saLzqfwg3hIv0WfrGPfqmVDqIwRz4fvh7DZbto=; b=YSy8I1GRr7JLiJjV
	x/6ClavkHdhSKAsQ9O+Qqit/6EcdInAGkZNjcXVAAt8CAU+RDv2UmPL+IB2F2qj/
	sLoeWYsE7a7Xkq+UkmZxIN9nDbsXkDawH/Kf2mXA5ID/PrCK8WP3FvDfO2z//gZ/
	vePKYQVOMoOn5of7TNNKy0/kFsW2D6PNFvBGaAo+SDjbcrg0zOeXxX6vUk9W1dRS
	zsb7dT/WLLTt2GEQCNwCVXESRdSIpCHD//qcXY7ON5zth4iOJS0P6FTkBflWz8Fs
	tGFVZWCrVEqznWibYPJu8vY5y8+CZ3k01JIFAkCJky2Vmh3dKtUm26kbqY/nJAN0
	R4BjbQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfeyys3kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 17:10:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso81398451cf.0
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775927448; x=1776532248; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7fOy5saLzqfwg3hIv0WfrGPfqmVDqIwRz4fvh7DZbto=;
        b=SFY7Qmo1IT5bN34vCHqxDBnPj8vj60++ulSDen28DzbBOvDPA68c+grXkra3CMC6xD
         MmEqsgsbHCrMHJuMjdE0EzgKrNOhpDYxjchrby5/Kd95Dyhcf20nMhFigxbzq0PDzbnW
         kB+BNozvP6a3Hsmiy4WKOeiLUnULew3XOPbBaxH0DQbXBHpe+F2S8Fkrfd3fLbBU0lIC
         agrYoFkagDOWr8MCLcBAGxEGZ7JAuALtZvfgpsuP+bqvherfiWNvxVJ2B37+AKK1JMBC
         dTlEev65SbycMQdiOCBuO4VbaJF1m/eVfoSho3mRt/ZBglDLbk3PgR8RlZzI4Ltt/2o/
         dXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775927448; x=1776532248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fOy5saLzqfwg3hIv0WfrGPfqmVDqIwRz4fvh7DZbto=;
        b=QPCp+pIsorw08O+VbF+VN+0bTznR6VC1uPLpfqvXqMB5278cUKjG6ccBNclAEePSuO
         l29Dd2Eb4ymF9Kqbt8/lcjHZml4mpbBq7V2SJ/JxseB40qf7O0yzz8nyvicPAdHZHeKK
         8MxjQulnLPDj4k2Pigw9igwNHvy26iZbJOET9G8vRWc0nid9GTkNo+ImHaqIPMbAp8hL
         KezU3KtD/VbSJbPssP+JABTQ2VLsgloEVY2/BwMY6Hahxe3iRtyfGktl7cO22ExOFks1
         IWlIqRcZkxdKzYRJPBSjjUnxI6c0qSzj8UCKwEJ51rzu5sz8g9WJIdg+J6tqQkMvPH6x
         dJRg==
X-Forwarded-Encrypted: i=1; AJvYcCVFEBYSfxjW+ak+JDBAxEJAnRndi3mFhY8qqNN/QTFOYT+EbHmwvHsmzP7Yz2HrmuKKEPgDqFvKKsV3og==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNPFImMKF1gpa1cDLGOJ1zO0LlfIMAIGoDHj0yWTj7tCPtX/AZ
	/tu1jjglgdPhbMX13jXIxVOkedFXKZTUe8wxSiXyJwSzkX8GgVO/UKAwe4++UscA/0L6l5gwFkj
	4jYsvTm+JWvMGzMcZ8QikJyuf538nGpXQ33nw8WG2+8LwyWuDrJ2OaAb6OT/Y5wGjSA==
X-Gm-Gg: AeBDiesagWJ2SdN9Ajgt4wHPxJuevLqhwuZLS8BWUMBaU8z2QG3fQqBmQh0M4i88FmS
	dpdSn9t7jByakIk+puA5AboH3kiXKoo+9WFxTNZ0JzqufakXaqxN5T6dalSsOj9biyrEiu+V1O6
	PM1Xb6nIVZFrQn0bO2Fli0gg3iXXshoPlVR0EQbFEF4J1GDayAE10yIBPl8lqvoftUTU8Bk6kTo
	0jbOP2lEy1bFLXzf4lfR7Q6yfho2Fh4N5E2O23xXKBRC5nw/nmGunt1ukT2hyeVI0gtNpJg34+Z
	zN140ppVzK4x8zoUwvH1uWfOMJQafwYDksqpE0UcLLuRj7AVRBp6BIB95np+unvbXB+v9XkphBj
	UcYPxu/ZwVN5Kn1W1nG/DKsuOv1w2kD4DyASQ4Ddb+ejNYQQ/J97ahjtJ6L3AXE9a3F3V+wg/Pg
	2BCHmWOOVnss+YipiSAETAXg6QF9QlVxuoBm4=
X-Received: by 2002:a05:622a:4a08:b0:50d:9174:cf27 with SMTP id d75a77b69052e-50dd5ada552mr108030101cf.20.1775927447784;
        Sat, 11 Apr 2026 10:10:47 -0700 (PDT)
X-Received: by 2002:a05:622a:4a08:b0:50d:9174:cf27 with SMTP id d75a77b69052e-50dd5ada552mr108029531cf.20.1775927447255;
        Sat, 11 Apr 2026 10:10:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee120csm1495055e87.48.2026.04.11.10.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:10:46 -0700 (PDT)
Date: Sat, 11 Apr 2026 20:10:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/7] media: qcom: iris: add support for decoding
 10bit formats
Message-ID: <434j4a4jln7abberxnrdd5fknpsca63irylpj4q74mvgsi7fkn@ipalraotc7h4>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <b4uqpepf6caojxe463izkmnrlayrdrgce6jusak33ewcr5yd4w@ukwbo7zfphn2>
 <454f0f277cbaee5774c25d34a33fc3bc478fa756.camel@ndufresne.ca>
 <f9edc172-c26a-4fa1-bca2-425e74bcd90b@linaro.org>
 <353933d7dc0821de180db2a8bae4b0d309ed4c25.camel@ndufresne.ca>
 <43378eb2-8976-49fe-add6-c691d78c0ec6@linaro.org>
 <a89f0047-e5e7-4409-bb6f-434f2b4501f3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a89f0047-e5e7-4409-bb6f-434f2b4501f3@linaro.org>
X-Proofpoint-GUID: zCjhTa65ew0b7xWbzFSBqA_BKZL7IBmZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE1MSBTYWx0ZWRfX4gy1pcXaouC8
 ucsz1znhEElRWu48aETmFrBF41RMbm33nb/9AVg61DGF7By8d8UQdbgctdzQ4aLylBBE9KWh/3e
 INlQZvsOFGfx9E1+sk3PITsr7Imvuy5RCsKVr1vQvJTfLZBVNpxGBxeXkOLi/LqtequQqoA0EH/
 CZWGz9LjE4Oy8O05EuYyvnCPil70f9Ar6Ni6/4zUYAOPYCmts/l6cb2v45EIyY7AA/BOY00yaAl
 PdJH2wLe+h6ZPi8daX/uA1Mnbh0B/6lNFZ8bHhIVubsKugR486o2EkBGWx8r0fiacQ7ZdPAzixa
 1Csir94VN67FjIxEXBXNJuAPAtkU0EPpw9WMApVKQGBz0Q0UxtwhvR2bbY2twp4X7I3jR/Z+yeB
 /y/3JtkN012tWrjfKyb9oxj8HdfqcvOK5G9i2U24pjrTO0z4hJekyby1vF4XU+OSk1GiU3lIJ18
 cok0SfvQSbLXHixS5qQ==
X-Authority-Analysis: v=2.4 cv=FPQrAeos c=1 sm=1 tr=0 ts=69da8099 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=L16fR37oqBIwrSETSwcA:9
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: zCjhTa65ew0b7xWbzFSBqA_BKZL7IBmZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110151
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58592-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A4D43E0F8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 06:25:55PM +0200, Neil Armstrong wrote:
> On 4/10/26 14:00, Neil Armstrong wrote:
> > On 4/9/26 15:19, Nicolas Dufresne wrote:
> > > Le jeudi 09 avril 2026 =E0 09:36 +0200, Neil Armstrong a =E9crit=A0:
> > > > Hi,
> > > >=20
> > > > On 4/9/26 03:04, Nicolas Dufresne wrote:
> > > > > Hi,
> > > > >=20
> > > > > Le jeudi 09 avril 2026 =E0 03:02 +0300, Dmitry Baryshkov a =E9cri=
t=A0:
> > > > > > On Wed, Apr 08, 2026 at 06:43:53PM +0200, Neil Armstrong wrote:
> > > > > > > This adds the plumbing to support decoding HEVC and AV1
> > > > > > > streams into 10bit pixel formats, linear and compressed.
> > > > > > >=20
> > > > > > > This has only been tested on SM8650 with HEVC, and was inspir=
ed by
> > > > > > > Venus and the downstream vidc driver for the buffer
> > > > > > > calculations and HFI messages.
> > > > > > >=20
> > > > > > > I was unable to get 10bit decoding working with Gstreamer
> > > > > > > and ffmpeg, but v4l2-ctl works with:
> > > > > >=20
> > > > > > Any particular errors? I assume Gstreamer needs to be taught ab=
out
> > > > > > Q10C. But P010 should (hopefully) work.
> > > > >=20
> > > > > P010 should work for both Gst and FFMPEG, its probably a user err=
or, or there is
> > > > > a hidden bug in the driver that make it fail, v4l2-ctl is very pe=
rmissive as it
> > > > > simply dump to disk. You should provide an updated fluster score,=
 so you have to
> > > > > use one of these.
> > > >=20
> > > > I did run fluster and all main10 fails with Gstreamer and FFmpeg, I=
 tried to manually
> > > > run the gst and ffmpeg commands with v4l2-tracer and logs but I can=
't explain the reason,
> > > > all returns from the driver seems valid but somehow they just error=
 out with:
> > > >=20
> > > > FFmpeg:
> > > > $ ffmpeg -c:v hevc_v4l2m2m -i Big_Buck_Bunny_1080_10s_30MB_main10.h=
265 -y -f null -
> > > > ...
> > > > [hevc_v4l2m2m @ 0x55c0328aa0] Using device /dev/video-dec0
> > > > [hevc_v4l2m2m @ 0x55c0328aa0] driver 'iris_driver' on card 'iris_de=
coder' in mplane mode
> > > > [hevc_v4l2m2m @ 0x55c0328aa0] requesting formats: output=3DHEVC/non=
e capture=3DNV12/yuv420p10le
> > > > ...
> > > > [hevc_v4l2m2m @ 0x55c0328aa0] An invalid frame was output by a deco=
der. This is a bug, please report it.
> > > > [vist#0:0/hevc @ 0x55c02dc9b0] [dec:hevc_v4l2m2m @ 0x55c029d510] De=
coding error: Internal bug, should not have happened
> > > >=20
> > >=20
> > > This one needs further investigation for sure. This error can be vari=
ous things,
> > > and it requires going up to the v4l2 code to figure-out:
> > >=20
> > >=20
> > > Case 1:
> > > =A0=A0=A0=A0 if (!frame->buf[0] || frame->format < 0)
> > > =A0=A0=A0=A0=A0=A0=A0=A0 goto fail;
> > >=20
> > > Case 2
> > > =A0=A0=A0=A0=A0=A0=A0=A0 if (frame->width <=3D 0 || frame->height <=
=3D 0)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto fail;
> > >=20
> > > But a quick look lead me to think it case 1 (frame->format < 0) since=
 I don't
> > > see P010 in the format map in ./libavcodec/v4l2_fmt.c (at least in ma=
inline).
> > > Its also missing support for any opaque format, in fact I believe the=
 DMABuf/DRM
> > > context is only in LibreELEC fork. But overall, it points toward ffmp=
eg for this
> > > error so far.
> >=20
> > Yeah I didn't find any ffmpeg for with P010 supported...
> >=20
> > >=20
> > >=20
> > > > The v4l2 trace shows a normal sequence with the driver returning P0=
10 as G_FMT after the source change event,
> > > > and the capture planes dequeued but for an unknown reason the buffe=
r is rejected by ffmpeg.
> > > >=20
> > > > Gst:
> > > > $ gst-launch-1.0 -v -m filesrc location=3DBig_Buck_Bunny_1080_10s_3=
0MB_main10.h265 ! h265parse !=A0 v4l2h265dec ! tee ! fakevideosink
> > > > Setting pipeline to PAUSED ...
> > > > Pipeline is PREROLLING ...
> > > > ...
> > > > Got message #37 from element "h265parse0" (latency): no message det=
ails
> > > > ERROR: from element /GstPipeline:pipeline0/GstH265Parse:h265parse0:=
 Internal data stream error.
> > > > Redistribute latency...
> > > > Additional debug info:
> > > > ../gstreamer/subprojects/gstreamer/libs/gst/base/gstbaseparse.c(370=
2): gst_base_parse_loop (): /GstPipeline:pipeline0/GstH265Parse:h265parse0:
> > > > streaming stopped, reason not-negotiated (-4)
> > > > Got message #39 from pad "h265parse0:src" (property-notify): ERROR:=
 pipeline doesn't want to preroll.
> > > > GstMessagePropertyNotify, property-name=3D(string)caps, property-va=
lue=3D(GstCaps)"video/x-h265\,\ width\=3D\(int\)1920\,\ height\=3D\(int\)10=
80\,\ framerate\=3D\(fraction\)30/1\,\ chroma-format\=3D\(string\)4:2:0\,\ =
bit-depth-luma\=3D\(uint\)10\,\ bit-depth-chroma\=3D\(uint\)10\,\ parsed\=
=3D\(boolean\)true\,\ stream-format\=3D\(string\)byte-stream\,\ alignment\=
=3D\(string\)au\,\ pixel-aspect-ratio\=3D\(fraction\)1/1\,\ profile\=3D\(st=
ring\)main-10\,\ tier\=3D\(string\)main\,\ level\=3D\(string\)4";
> > > > /GstPipeline:pipeline0/GstH265Parse:h265parse0.GstPad:src: caps =3D=
 video/x-h265, width=3D(int)1920, height=3D(int)1080, framerate=3D(fraction=
)30/1, chroma-format=3D(string)4:2:0, bit-depth-luma=3D(uint)10, bit-depth-=
chroma=3D(uint)10, parsed=3D(boolean)true, stream-format=3D(string)byte-str=
eam, alignment=3D(string)au, pixel-aspect-ratio=3D(fraction)1/1, profile=3D=
(string)main-10, tier=3D(string)main, level=3D(string)4
> > > > ...
> > >=20
> > > There is not a lot of details here, but I would start looking into
> > > V4L2_CID_MPEG_VIDEO_HEVC_PROFILE and V4L2_CID_MPEG_VIDEO_HEVC_LEVEL
> > > implementation. GStreamer (and Chromium too) will refuse to use a dec=
oder that
> > > does not advertise the supported profile (though I see there is code =
for that,
> > > maybe its just some bug).
> > >=20
> > > >=20
> > > > In this case OUTPUT is not STREAMON and no OUTPUT buffers are queue=
d, so I wonder why this one fails....
> > > >=20
> > > > My gstreamer and ffmpeg foo is bad and I probably missed something =
obvious...
> > > >=20
> > > >=20
> > > You may get a different hint with more traces, just enabling general =
warnings:
> > >=20
> > > =A0=A0 export GST_DEBUG=3D2
> > >=20
> > > Or the full V4L2 traces too:
> > >=20
> > > =A0=A0 export GST_DEBUG=3D"v4l2*:7,2"
> > >=20
> > >=20
> > > I'm sure its just a bug (or two). Happy to help to find it.
> >=20
> > You were right, this did the trick:
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/dr=
ivers/media/platform/qcom/iris/iris_platform_gen2.c
> > index a9cdd93e77fd..debdd30a751e 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > @@ -56,9 +56,10 @@ static const struct platform_inst_fw_cap inst_fw_cap=
_sm8550_dec[] =3D {
> >  =A0=A0=A0=A0=A0=A0=A0 {
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .cap_id =3D PROFILE_HEVC,
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .min =3D V4L2_MPEG_VIDEO=
_HEVC_PROFILE_MAIN,
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .max =3D V4L2_MPEG_VIDEO_HE=
VC_PROFILE_MAIN_STILL_PICTURE,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .max =3D V4L2_MPEG_VIDEO_HE=
VC_PROFILE_MAIN_10,
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .step_or_mask =3D BIT(V4=
L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .value =3D V4L2_MPEG_VID=
EO_HEVC_PROFILE_MAIN,
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .hfi_id =3D HFI_PROP_PRO=
FILE,
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .flags =3D CAP_FLAG_OUTP=
UT_PORT | CAP_FLAG_MENU,
> >=20
> > But the gstreamer I'm using is too old and doesn't support P010... upda=
ting but it should work now,
> > and I'll test the QC10 in the same time.
>=20
> Tested with gstreamer git, it works fine now with P010.
>=20
> But I applied the QC10 change, but how am I supposed to test it ?
>=20
> The QC formats seems to be detected and the right modifier is used:
> 0:00:07.231474967     296677     296852 INFO                    v4l2 gstv=
4l2object.c:5544:gst_v4l2_object_probe_caps:<v4l2h265dec0:src> probed caps:=
 video/x-raw(memory:DMABuf), format=3D(string)DMA_DRM, drm-format=3D(string=
){ NV12:0x0500000000000001, NV12 }, width=3D(int)[ 96, 8192 ], height=3D(in=
t)[ 96, 8192 ], framerate=3D(fraction)[ 0/1, 2147483647/1 ], pixel-aspect-r=
atio=3D(fraction)1/1, colorimetry=3D(string){ bt601, 1:4:16:3, smpte240m, b=
t709, 1:3:5:1, 2:4:5:2, 2:4:5:3, 1:4:5:3, 1:4:7:1, 2:4:7:1, 2:4:12:8, bt202=
0, bt2100-pq, 2:0:0:0 }; video/x-raw, format=3D(string)NV12, width=3D(int)[=
 96, 8192 ], height=3D(int)[ 96, 8192 ], framerate=3D(fraction)[ 0/1, 21474=
83647/1 ], pixel-aspect-ratio=3D(fraction)1/1, colorimetry=3D(string){ bt60=
1, 1:4:16:3, smpte240m, bt709, 1:3:5:1, 2:4:5:2, 2:4:5:3, 1:4:5:3, 1:4:7:1,=
 2:4:7:1, 2:4:12:8, bt2020, bt2100-pq, 2:0:0:0 }; video/x-raw(memory:DMABuf=
), format=3D(string)DMA_DRM, drm-format=3D(string){ NV12:0x0500000000000001=
, NV12 }, width=3D(int)[ 96, 8192 ], height=3D(int)[ 96, 8192 ], framerate=
=3D(fraction)[ 0/1, 2147483647/1 ], pixel-aspect-ratio=3D(fraction)1/1; vid=
eo/x-raw, format=3D(string)NV12, width=3D(int)[ 96, 8192 ], height=3D(int)[=
 96, 8192 ], framerate=3D(fraction)[ 0/1, 2147483647/1 ], pixel-aspect-rati=
o=3D(fraction)1/1
> 0:00:07.224200523     304189     304365 INFO                    v4l2 gstv=
4l2object.c:5544:gst_v4l2_object_probe_caps:<v4l2h265dec0:src> probed caps:=
 video/x-raw(memory:DMABuf), format=3D(string)DMA_DRM, drm-format=3D(string=
){ P010, P010:0x0500000000000001 }, width=3D(int)[ 96, 8192 ], height=3D(in=
t)[ 96, 8192 ], framerate=3D(fraction)[ 0/1, 2147483647/1 ], pixel-aspect-r=
atio=3D(fraction)1/1, colorimetry=3D(string){ bt601, 1:4:16:3, smpte240m, b=
t709, 1:3:5:1, 2:4:5:2, 2:4:5:3, 1:4:5:3, 1:4:7:1, 2:4:7:1, 2:4:12:8, bt202=
0, bt2100-pq, 2:0:0:0 }; video/x-raw, format=3D(string)P010_10LE, width=3D(=
int)[ 96, 8192 ], height=3D(int)[ 96, 8192 ], framerate=3D(fraction)[ 0/1, =
2147483647/1 ], pixel-aspect-ratio=3D(fraction)1/1, colorimetry=3D(string){=
 bt601, 1:4:16:3, smpte240m, bt709, 1:3:5:1, 2:4:5:2, 2:4:5:3, 1:4:5:3, 1:4=
:7:1, 2:4:7:1, 2:4:12:8, bt2020, bt2100-pq, 2:0:0:0 }; video/x-raw(memory:D=
MABuf), format=3D(string)DMA_DRM, drm-format=3D(string){ P010, P010:0x05000=
00000000001 }, width=3D(int)[ 96, 8192 ], height=3D(int)[ 96, 8192 ], frame=
rate=3D(fraction)[ 0/1, 2147483647/1 ], pixel-aspect-ratio=3D(fraction)1/1;=
 video/x-raw, format=3D(string)P010_10LE, width=3D(int)[ 96, 8192 ], height=
=3D(int)[ 96, 8192 ], framerate=3D(fraction)[ 0/1, 2147483647/1 ], pixel-as=
pect-ratio=3D(fraction)1/1
>=20
> But what's the proper way to validate ? I've been unable to run kmssink s=
o far.

Unfrotunately the easiest way would be to get it to work with the
kmssink (or to dump the raw buffers and then get them displayed
manually).

--=20
With best wishes
Dmitry

