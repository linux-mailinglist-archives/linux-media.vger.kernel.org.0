Return-Path: <linux-media+bounces-57384-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JcgF+EJx2kyRwUAu9opvQ
	(envelope-from <linux-media+bounces-57384-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:51:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC57334C23E
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D7A4305A88A
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D9939BFEC;
	Fri, 27 Mar 2026 22:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPeJjtd2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6CxWZun"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227436AB76
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774651715; cv=pass; b=hOwKDKsLg38rNQC3cQf/hU0qs4OG+7oUX9bN953S/VAfsnqig+mbzh0srnXjVPS+lPN8DHqQBxISqf33TB9ylLscE7qoKJfPMdqAwlWOnZ3fnJZCGduTGyIp2YIOCJO2n/w7plBTGAbTRqGkJWbK3UGXc1yZJ72qC6jIjdrfOsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774651715; c=relaxed/simple;
	bh=O1NKOiweRJjnjoPU1WxUJ2OHjCKtZyFHqNZw59QAu6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hG7lRJwqtZjSh7JBxmIJMKwGdoLLUcpmrgWGTzuTWM5l7g7gPzyNqDGImJEPFHDrVSyraLhEgJgoLhdfaVsYGN44v2JXgjP+OCFEAWC+gn2x/S0I9XPhUDddgSjPpD6E2OzGVFo3FtBmBBfbTkz8Ldxmtqr5Ct1S+QR0xsJ72cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPeJjtd2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6CxWZun; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLfpl01478827
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=; b=PPeJjtd2pfiqnLS/
	Jq8Nna4aXwsTQmqjKuGssdXhoIxVexBOzodyMJqJltnCu63kUZIZLdBaMR37lMn9
	4JphGMOQ/U9bW0W5CKNH48pPX6+SF3qCfE/Ci2Q5L+c/uLVy3Zq4z2GGA8x6X784
	v9Rxl1SI1s24VDZ/q7PzOD7A90lLWOpMzrV9Vf+kyJYeLyBzY484Ywg0VWfIDk11
	anj27futnyjEyJnqdyBlMPlXCTa7cNoYwv4aTxItJJGYv+R25W9R4fTO456jpG5B
	J5Ao+vPRDjtj99C1pfRmfOFt7WnxA6idSDbe2HpKHCFt9nHpuyqjaFImEz4TuBPv
	3/cE5w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6111g9jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ce375c788so5958316d6.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774651712; cv=none;
        d=google.com; s=arc-20240605;
        b=YNxx8jvWlt+nIRhE2ZWgwhSW3ns9+xgx5sZsC09z3ybHbMsweOQ2yu1JVei+58GSRJ
         RTO3eYKt6VFGMzbV2p8W8EJo0JYdSaB11P730N2hDJ4hTkTzPc+b38BhcaDonouweGbE
         RnIvAQCh1MsZMFhzU8y134AOcjhcrufz+Da1NNy+wlkN8D1bRsIIoucg8+DDIwJ3Gd11
         DkfEPHnqsSZLyVBrTWqQtwJNJNGDnf23aE8DpruBXy5ZfJTqbeNDEWbXjfU9ebzRk3PZ
         PtDJDdFbaTINIDRgRZBkLfUT/PpdYJvfoGCSsFqa8i1K2YRepl1mtU/sfUODhoA1PKQg
         gfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        fh=Ae1GkzfgZNTVgMZLvUa7Fh125qfndpIJWi1H9W/gEyA=;
        b=RYf/KJ2APP/W3hnRCOXC1bd6Y1TLGuacNjt9iYMYZ6Hgoxrul8NLcbTdo8YfN1emgc
         uYrZfUTGsUDViUMPQzfucv991Qd660nd97xAYGVvuhhtVzDw02ZKxA7J33iKcpUKLBVY
         cYdUVgsJyTJmdCwXp2myofhCxmwgvElOTa+JYUUZlJKniKQjXaELXmnqh1v/+JKMyuHL
         CZ90+m/F/Z1To5+mE4R13TEt5Gs27mLOmoAZ7cNlP/Mcl82jNacdqo3Er0VJiAwubbIt
         DJPQbS9vogaEJ040+8k/2Hy1Du9KFAt2pr7kEfL4101+igUqsQqxqcqEPIAB/lqRWyr7
         dgHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774651712; x=1775256512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        b=e6CxWZunAMu4cjBsPAxiiGxsTFNQ/T/GSaR90nJhdbmnImlnw1xg/OPWjWyuQP6lSA
         ttmn5XVJFqiIBMzyGZcPvUO2nEwuoFkPsvgOSuvVMXaxYY2lkzg3DBYt4b2phO5W7EOB
         wI4iKbGVzxXJzXc6XzBVgCjSBWBzJoXTyRnZs9qy3usvfbCD2ckSIZZD/9xUQtb3NPHr
         meGHsbth2v1+QhLgKsxwqPUetSqBLTNFbbMKOMRkUR67wA1iLW16MXYgUaHSpjiyRwUx
         lb/4j2ZjIb5kC8t8TLhKDl0cS5uB7Ll5eVmZ2uMZRBdNiLs0dpfpaPbhDXyb+kNiKS/J
         kD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774651712; x=1775256512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        b=RgUn92BIdxPU7sZF0T+KKrqvvkdR7pSohbzIcQ4PwaW919G8IPtOqCYL5dyjvaP57h
         yPprlH1nYhrOE/zUiaajfn/tST18FZNI+fXtbwbZLj1LAqi1559io/nA/nQuZXZtk6mj
         kqZBgw+oK4oQpxgl55ZFO/402mSSyWy6YEu4yoiVu6w2n7hgcYAUhhqaj18K/Hn97LzC
         1RAaB4ktarQZ77jg0iJDqDdRqXOboj4TjeJ5QAR2NtHE38xdXIsXRzhcJd0+RTMHcWex
         lOxmj8ETkHBhhcdQX65LKKVdOCEO+pqJQzQgObOKN6OVY2xk6gdOtvpNHRx1u8ytV0bV
         PW3w==
X-Forwarded-Encrypted: i=1; AJvYcCWlvsN4w232XH/FH5GjImoedJQDDA2U3fS/pd8lOzzUzem7cdinXX0/mY51r9ddkngDq/Y8rm1WsFrlyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs8CoI6c/Mg7KiV6xbjc5vTOaI+Q/oZK7WbyJ4knViuqYRyMYq
	JT1G8AhTBTUqufWXmCOLNb6F4vtoj6eUv1CgfEyI1SHFF0yLsTLWmalGXs7J5NZCL8e4+C/A3ru
	6pdv03unv0T04NXc/qvL5GFRncNQtiMbE+NoUuWKosSHqbPEQuHEfDDK5NeTZ9cnXOxZ0uCl7Ly
	wyHXSeXVi8UeWs3ZARetubadkjgJ0eqWKpyBBkKe3p
X-Gm-Gg: ATEYQzxcnY0U4i9emM1ysQztBBdSpGt5XBVFXSsrVj7Ll/JqF0HHLj249s07noCWqUk
	3WaeFI//eTa68SRe1U+tB4CP+lX8zZ9GhiS6jgw0CfMAREdBNv/wyceXOyGSlHwm5Sk9+S7UG4s
	sRn9UwiIEK4auv68nHo3/j3At9+sNEKUM623J2bZJsarlaM0nrS0VJfJOGbRrrNLX7ds2epXJPf
	ebLGj1zKIJ6Pr0D/Shhd64abVU5zwnkc4zfZ3/BBU2vlMRaR4E1Nw3fPK8nEfDx0A0A
X-Received: by 2002:ad4:4ee9:0:b0:89a:126a:5b7d with SMTP id 6a1803df08f44-89ce8d5833fmr56319766d6.2.1774651712371;
        Fri, 27 Mar 2026 15:48:32 -0700 (PDT)
X-Received: by 2002:ad4:4ee9:0:b0:89a:126a:5b7d with SMTP id
 6a1803df08f44-89ce8d5833fmr56319316d6.2.1774651711923; Fri, 27 Mar 2026
 15:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
 <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
 <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6> <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
In-Reply-To: <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 23:48:21 +0100
X-Gm-Features: AQROBzAMm1yN1rLAJcaNHZgHlMfTEGzX94B2QA3fXAqRa4WXjkjCipnSkkRQp1k
Message-ID: <CAFEp6-0og=MJm-kZmTdTka7per6eHvfO8pR1k87NwGT0no-Ncg@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate sub-devices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MCBTYWx0ZWRfX0pjMJToS5TUk
 BN4eFdpYklbOJEqZnQiU8F8FyPGuAECeaV6lBoLMAZiy+ipguFLsGjjS9qzvgD4H0Ms0QRoRM5V
 8FM7yoPsD3QrMARDdstD+RExsHj1AvczUsEV29qVvHMh4R4UHP0Z8nmYTTs+kTCLmJJlSCgDdLC
 7STKOpmDBtwUS7Iuso3NSEQC1jkuIClF+gOApmylOBL7dgvUCprKe3CkOjPXtSUlk3hNaH1/6L4
 kHL8Nwb+2mh6DbDppUI+eagMX396Y0JJh3DtxpdtZFA2CewWwlmo4RUBFYcdojmRdxFhLnADE1T
 dNTxmIgDePUiBb3f7EBcBZtp0aSq0FoZHMSZODQkh1vkXcPdDnlnRJNqGIU0r3Z0Mh4dXKgRZ0R
 biXrBN49iQMdkakdgZ1wydCSUadFVem6EHzYyv7vo9gi5OAAjmfoJyp+xPWhPVjmmx6bvGonM1V
 VRvOY743S4KqIevk0xg==
X-Proofpoint-ORIG-GUID: ud42UnOQempiDv4kZECfXm8VEHh_kz6u
X-Authority-Analysis: v=2.4 cv=aoW/yCZV c=1 sm=1 tr=0 ts=69c70941 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XwtK2cgshX5IxEekORwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ud42UnOQempiDv4kZECfXm8VEHh_kz6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57384-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: BC57334C23E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:37=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 27/03/2026 21:33, Dmitry Baryshkov wrote:
> >> Other drivers typically call the populate function at the end of the
> >> probe function. In this case, however, it is invoked before the main
> >> resources are enabled. I assume this is because the CSIPHY device
> >> needs to be available early. Aside from that, it looks good to me.
> > This becomes fragile. The CSI PHY might be built as a module, which
> > might be loaded later.
>
> Is it any more or less fragile than "simple-mfd" in a DT though ?
> Krzysztof isn't very much in favour of simple-mfd so this method of
> population is the alternative to hand.
>
> The CSIPHY driver uses devm_of_phy_get which handles deferred probe. If
> the PHY module isn't loaded yet when CAMSS tries to get it, CAMSS gets
> -EPROBE_DEFER and retries.

What about relying on v4l2_async_nf_register() in the same way as for
the sensors? That would allow both the sensors and the CSIPHY to be
bound asynchronously when they are ready, assuming the CSIPHY driver
registers a V4L2 subdevice...

>
> >
> >> Reviewed-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
> >>
> >>> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *=
pdev)
> >>>          if (!camss)
> >>>                  return -ENOMEM;
> >>>
> >>> +       devm_of_platform_populate(dev);
> >>> +
> >>>          camss->res =3D of_device_get_match_data(dev);
> >>>
> >>>          atomic_set(&camss->ref_count, 0);
> > And this looks suspicious. What if drivers for submodules are already
> > there and start probing once populated? Do they have a chance to access
> > this ref_count?
>
> Nope, we don't share the camss pointer or any of the data-structures in
> the existing upstream driver with sub-modules.
>
> ---
> bod

