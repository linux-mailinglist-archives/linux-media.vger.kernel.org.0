Return-Path: <linux-media+bounces-58048-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PqZFslV0GkA6gYAu9opvQ
	(envelope-from <linux-media+bounces-58048-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 02:05:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C76883992EF
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 02:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E3FD3064E25
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2026 00:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7095481724;
	Sat,  4 Apr 2026 00:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8N0QcZK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bdf0SyQ9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B211531C1
	for <linux-media@vger.kernel.org>; Sat,  4 Apr 2026 00:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261064; cv=pass; b=QzbzjPNPsflGdDc0gkTzLv4Qw3QByQVu/ggNd+i2qiP/cuWizQWaKr6UcgfHDCl1dt0uh3tu3fS3tDxyWX2lqg+MyrHSjLiDa6PLMfs97bPiC/gH+ho8h6Gv3OKKeMkeLa4MMv7+RuVOs7JyR4cxII0D/YZ46Ge6gPw2ZxPuwAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261064; c=relaxed/simple;
	bh=bMqGxuMveB8N/Dnc0BM4cz72pAu4ebVe5GE38KXtUWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzQDQH7mOQlz6ftHYBio+53BJbZWnPNVM4Llc3WeJgH/RXKKxv/XILWid2h9V6qQE5B8Qyrvv0dm+vEXBhfXufTaTRGD6Xi+UoM6SGhGAIF+QNDrJXdV5xt7GxY6MyOL5IeE06bOpFN23x4zttHwYHN1cFu+dzu7EAqPnY9czJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8N0QcZK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bdf0SyQ9; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EhnWe140000
	for <linux-media@vger.kernel.org>; Sat, 4 Apr 2026 00:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mVBhn/j5Zs87fQ99Bokk2uut
	cUriWDK6vQARo+vqRZA=; b=C8N0QcZKfCGryNLnc5Kq2sr6nIkkbjtShCuOsa1Q
	94ZkT3IMd9eJxIsU465A23791xIA4BIVlAsDqAkiYS4rJd8ru/oY6k8vP1u9x6w/
	R9gCVYKQlnluvk6WW3rjAVUYjx2xzvHUArKCYpmF7hK5s54yvOqlMM68Q32+FlIi
	ZtPIvKHssH7+8GULrBWjSMNSjKxFvKWlff1piSgHd+tuSPsEib9j62P03yK3WPCW
	/qxFDsp87u8/96OUWNzb5dPjsiFWXvW71LVXso03x4FzhBH2iN2ZHoZFrwfOcqHK
	OIj7B+omz2AfkS9YPwP7xC0MO1c5d8SZR4R+mG5ZIriyhQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y2pvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 04 Apr 2026 00:04:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76b69fb9d6so2079900a12.1
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 17:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775261058; cv=none;
        d=google.com; s=arc-20240605;
        b=gqRlYeSqr9GSm7dLkcKcUzjabYstZb7/Rla+5UhM/lzZDLuXmU3HHBCFPeiDm2EUtx
         yaMNmcZMHU/p8XcpBf4wODTiZ48yPFhF7AsLFxyF4hYn9FItwjxp/s8nJ+lx8Iss8qHn
         vIS9GkcwK/vrJlwVG93vRkQoD0HWi24mLena2Di976ua+t3+icqqXhntvUNhH7nCbDdG
         /uYH5gSPRjUSYaZwx8mDHV9r1QikvW4utbuXOxRx/aUCFx+Hv+4s6d/FOsTILS+eqfWp
         tbiR9TeVnHc+nSP98wOXcP2373TXai4eLeJNb2/OdfzJwwaxmU8g2LDv5IIvQxUj72k/
         DCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mVBhn/j5Zs87fQ99Bokk2uutcUriWDK6vQARo+vqRZA=;
        fh=TjczU+FATkCWOTu62QVZM0dmH0UaWfibOy3BD3TEk08=;
        b=P5K+ivLUc4kmttIhmptCihiMQIqyZLW4BRXRt1WQtIW436AAAVwZi6365TNBLaLWek
         axQUaLS7pIpvrJU8Xv84C3bGaLe1W64Qhyy8aGsCEoAQjI5MXpY1IqSgTTngmIWltm7M
         9O3nhVnGphXgLqjN+Qda4CBjrLngV7uSfHuZXN4KTsV2KmnXV9wFxxDFH8qKPnE3qXYb
         dyvfbM5bJzDplE1bQutV9g7qeqto5cJk2UfTMi2CX4bwoCgIzNYsK2yoNbpHLbHP/S0k
         EQyKOBTwfNWpVQCogl9oB7hKKHbh4GksXsZ9eFkbTAzGkEJ5+sQN7VQaDqKe8iczLRCv
         Fk7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775261058; x=1775865858; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mVBhn/j5Zs87fQ99Bokk2uutcUriWDK6vQARo+vqRZA=;
        b=Bdf0SyQ9MCQ7nmJZhdYt0+siCzt6UaXOJle4UzLA2MJlkPabow5/huroo48Q7tvutV
         gx8kjYhoB66+lDH2N0iIeBX/jafFYxpMvtBCxSlze5vKUNa+gX5WdIYos7nLwyDDQDSo
         IiJWb9hH4m8yRFpTijIGyS0seaIYTAaQKi1We0Nq55UeA8DWE77ELr6/hSqsIhKIGDaZ
         tUZbTbMvnENBNfaD59kub/zx/7OWM047kGqjBuyH10FT8c0lMgdIJ2EBjA/nH2v3GpD3
         P8R+cNPmeQbj91wtUBKXBJSrXEjF2DNmVnTKAEcKbsZhE2in8ss/F2KXZ3REy1IxRvNu
         5/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775261058; x=1775865858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVBhn/j5Zs87fQ99Bokk2uutcUriWDK6vQARo+vqRZA=;
        b=LThl4bYBnyFXbCmfWToIkvQD4g7vRGsu92NydzqmtZBywvQjIRGVRJZvFYUXaevhlr
         C4RCisNR7dDtKUUQqvAXFm2oVj6P14BBANCfFAMqvxZltEcT24zyoWBM20KgpCAjxZt2
         BFOJtdt9hUT61SQtAVgCBQZSvkvkIB+n7zv6mIyG6F4cs8Bp199LI0AghTfZrG5Rnmap
         vSNCEdMi7RkA9UyrjX6QUFrT/jcjNvhNBRh78gAEQyd5teRdXELeJNeY4HZL10Qy+ViX
         oQNTl3I5Bw+SbbLKLm9RqgJgGCQ3oqztcAyTs3rhmCwdhlLLbcGTEgqqIS4QbD5Qj5mn
         6rnw==
X-Forwarded-Encrypted: i=1; AJvYcCVXsa5+uroEYM78cZLrlifhUu9/bKh7xDtuj8PgMD0Ia9qmfG2bGp8uyFBTWUFiricJ9xvoYVChv1q35w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFy60dCIPYyAtuJYu1sk1bt6PYIVGbfDmNPQssORYitzFFMRWO
	Pofp8qGF0wslLZjMqI0UqJeHXu5hAFInfkwhfDwNm2uNXeuLQkXMwqNSmprV4UgXtindRWINkc2
	OA5zR3QUyIDTDMqRqTpQ8OXgamixlPJj+3z8mjCRmAhapyu2bGS4JhfQczpiq62bQouChAfvfZR
	xHqUm45vUzPrFoC3v4YAnZI7Rb5VUS7BKIdgfboLz8
X-Gm-Gg: AeBDiesd2dapfheUPwEoRPF0fS9OH9Uw0lvxw1hUkpi+T8p+xVXQb7bDKRgLH6SH3jN
	b/tR7Ivhz0WMpopogAgh+fkfHIOCBojKpu+J52BJhFWZi0j3uErKosBd3HBdO1bObu2jFh2+yzs
	rq7w/q5G3PqT2E55j5faQjueiMeIerWeft4/r5Y6B14vBukQywSAESy9Uc9D2PygxfyF6XpTpiW
	fSSM1E=
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b277e36491mr72789905ad.14.1775261058093;
        Fri, 03 Apr 2026 17:04:18 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id
 d9443c01a7336-2b277e36491mr72789565ad.14.1775261057567; Fri, 03 Apr 2026
 17:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
 <20260403214140.7307-1-threeway@gmail.com> <uiv4w3eptbniohzanp753f3wtwt4efjxupdro7kom2kgycco7f@nks5b4ctxty7>
 <47061b6c-8589-492b-888e-3550c878e072@linaro.org>
In-Reply-To: <47061b6c-8589-492b-888e-3550c878e072@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 03:04:05 +0300
X-Gm-Features: AQROBzCHfiSEFgykc--8quwVwkz3slXjV5fcPMrhEohl8fqeroSmIXA1wvDwueo
Message-ID: <CAO9ioeUjYrR6fWSxm2DP-AhEMa8ZxSKE5CfQq=s9BhAqWA-5=A@mail.gmail.com>
Subject: Re: media: iris: enable SM8350 and SC8280XP support
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Steev Klimaszewski <threeway@gmail.com>, vikash.garodia@oss.qualcomm.com,
        abhinav.kumar@linux.dev, andersson@kernel.org, bod@kernel.org,
        conor+dt@kernel.org, david@ixit.cz, devicetree@vger.kernel.org,
        dikshita.agarwal@oss.qualcomm.com, johan+linaro@kernel.org,
        konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, robh@kernel.org, stanimir.varbanov@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d05582 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=n3mMJPqUfPv-MVqFI_IA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HXMtsrjELieOo5ulSJjyD2fTb_CqOAJi
X-Proofpoint-GUID: HXMtsrjELieOo5ulSJjyD2fTb_CqOAJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDIxNiBTYWx0ZWRfX6l0v9srkAlU8
 IhcjgwCvyBF2ItRvUeu2FRcXMkVRxpGuf9e3EDGihX7V6+0kesER7LWbUnYG83reppr47d0Lgfk
 A30deX0cFGefj63KmQJ6Lm13RvTwOINNorlY+5OmloWo7/87BX9s0aMhUVodbfyvr6gy6LSNTPT
 Bu+aEeDZUVAhzlvK3UwuYNWLTPJtvNq5z9wYKc6tCfcxa/sW4IRyNN+ZFARS3AaRdmTmziw+uAN
 iKO6olZTc1JBoLYMm4BJ0GdeyfDmOfeu6THjBRSR/h8tRi/UXrmqwEGVJtylNwBMEMEs1Dm1Aw/
 PQQYGs2Bl6DCk2wvGiemWvy2/kuKOqPVbm8BTxRBtIxEtzLkVolX/970G5j4samLYObeHgQ9GEp
 KrFgf7OOmy3Z1zdY0JN1yqV21tB8MYiKXOypm/35ZTd7mVNHyv+qve4u+njeleYZCsbTrl2Zf/t
 yV9alQOfb1JeGxNVb4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030216
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58048-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.dev,kernel.org,ixit.cz,vger.kernel.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:dkim]
X-Rspamd-Queue-Id: C76883992EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 4 Apr 2026 at 03:00, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 03/04/2026 22:59, Dmitry Baryshkov wrote:
> > On Fri, Apr 03, 2026 at 04:41:39PM -0500, Steev Klimaszewski wrote:
> >> Hi Vikash,
> >>
> >>>> This is not just with totem, showtime shows the same issue.  If I let the video
> >>>> play, it plays just fine, however, if I attempt to skip forward, back, or even
> >>>> play*after* the video has played, then I see the smmu fault
> >>>>
> >>>>    arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
> >>> please log the info about which "iova=0xd51e3e00" buffer is faulting in
> >>> this case
> >> I will include the diff that I applied against my kernel, in case this isn't the
> >> correct information, but I get the following output in EL2:
> >
> > But these logs don't capture, which buffers are causing the IOMMU error.
>
> I'd be interested to see if we can run this test on venus - instead of iris.

At least when I tried testing it, venus wouldn't even boot the
firmware on SC8280XP, citing UC_REGION error:

2026-04-03T01:51:05.376407+03:00 rohan kernel: qcom-venus
aa00000.video-codec: non legacy binding
2026-04-03T01:51:05.437232+03:00 rohan kernel: qcom-venus
aa00000.video-codec: invalid setting for UC_REGION
2026-04-03T01:51:05.437838+03:00 rohan kernel: qcom-venus
aa00000.video-codec: failed to reset venus core
2026-04-03T01:51:05.437850+03:00 rohan kernel: qcom-venus
aa00000.video-codec: probe with driver qcom-venus failed with error
-22


>
> Konrad's patches are still floating around somewhere.

I think it was captured by Steev:

> This is much better than the previous venus patchset where accessing the
> hardware decoding would cause the machine to hard reset at least!

-- 
With best wishes
Dmitry

