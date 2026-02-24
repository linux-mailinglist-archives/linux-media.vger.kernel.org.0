Return-Path: <linux-media+bounces-53260-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEXQDY8dnWm/MwQAu9opvQ
	(envelope-from <linux-media+bounces-53260-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 04:39:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E6518170A
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 04:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E97A309800F
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 03:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEDB2BCF46;
	Tue, 24 Feb 2026 03:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fL9LfETQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ye0362eO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01472701CF
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 03:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771904383; cv=none; b=PiOkn4des8tI22yInafbvDhkBGp4AEraWJ8HIWjwQZhM3sMYK0G9O0iS4W1mE5WTU0sQhxL+PxP4PAN1FzqDz7YqfO4vFD/NqNkQrjVK5Y+NcJgZP1L79tjY0EZt57f0uAv3x/re7quOulk4eX/Qh2OP53W9mJOnziX5BKFBGqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771904383; c=relaxed/simple;
	bh=BIKoM8z9nstVrL4h5mDb+fYd9te7PInNqQQm2CNDpmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oE4pIYwvMvUrBHjQ0/KPNIZ/CnxGjG4jguqLI9oHsylvK1zQ4o1yZBnCN/YCpdqCGOZgMkmSFJ3TZ0mrATV76ZbVFquamvg61psC4CsExFfnbAeA82T2tD3Tp2toA0mpJbK47oxsvTqHfEpHhP6HKIYFAH0GAyl1/FMAmbTyaP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fL9LfETQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ye0362eO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3LYiE891454
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 03:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KILrgs7d74mR23o2eIzLn2FfkB9mDLXK+R0lgubWZsM=; b=fL9LfETQS8Vb/1Xl
	jdJ4gaRZDr8qxINFPzWmOkXDWsoNl64GHSh9uT6icfJfocI69K0govoY/vLEp9Uj
	CQ3+L2j1FpVamayYUciAA9KGg62JWBozxHfk8SZbhbl1bLTFg/z38s/DdkOZcjJn
	5F2lgvkmXObVr7Fely/OBCEQ6muoRdp/b7rrIgJFNgm4HYUvZ7ym23a1w13eE029
	DBhTaP8LkwlQm0/cEo9+EYVXYE2lBZbZvufVvhaIuxbOFKiXazG4rEReRG7Bnt3o
	+NlKc6YJODZ0CbjBOnMqDYETH8RoXITeca4ByZl7YG3cq2nH9inbwRfto+EhaSkO
	BHurCg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8afkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 03:39:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bda35eab74so614491eec.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771904380; x=1772509180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KILrgs7d74mR23o2eIzLn2FfkB9mDLXK+R0lgubWZsM=;
        b=Ye0362eOWkmS7kVOU/KNvzBT1EW9ru/gy4RFTSUxSv4O15j1Dc0oW+qpCi8BtcXyY8
         I/5Ta9erQu8haB9OaJDLuewbfdHxk24mbfFNtxJ1+H7zjl4snGLsu3KAYLRvs1Uxeh2H
         FhJgm9Qq/U97B76vcB5vtaAtNHRVoPnzOmCzeCgY3FXb0sVOhI4GTnVpH2RvLAuYC/5g
         AXIzqCSrC8hNkusAULyKiYCjD0kP/43sBTct1LU9BflT0P66CkNd+vQFuVn/aL39dsWV
         1vY4AlWVy0cg5+Xp7sXl4SxHjtfvJFN/NBbHV6PB5fZV4nnmPK9K0TEJn2P+qx4ummtf
         suUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771904380; x=1772509180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KILrgs7d74mR23o2eIzLn2FfkB9mDLXK+R0lgubWZsM=;
        b=bQqssA67Id3EWQKpxVssdigYJ6dKqJ+qCs2gkK/MgfiMrdSIKzRlKkFTOxw2ESLv4J
         7ywGUOi0A22RigHOF9s6unwGvM2qgIDpRm4YH7zVMH0pHoHzIFVCGgco9AzAs3+9m8X+
         nDqdzQNiHZ8xPMQYtCPNqhGyPedvQnC12yewEU/j0b2P14JAtEUwRF4ltKuaiBpyT54y
         tLBkQVovEuAEoxEwBFbhz+uM+n2iANqWbxmHItcuePo72DIog3+B2DfhsG2bvhGJ3ZBt
         Q0lcDbv5e14WbH58V2YTwy76hBjZNDSz+qsWKXnI4Pc0rINTvyK0Lyd/m4ViSkB1v+sM
         pZiw==
X-Forwarded-Encrypted: i=1; AJvYcCVfmjgJLFukwuKJD5r6RRWs1iD99nMUAUF696DN/0LEq8+KviVUAfkEUe0ibWaI29EvSfrwzCWk998I8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzvI8JgqzHdYy/DUMMPHL24lffGpB0B9fe7E0c6sowEmrVBa6l
	4NDJE4yRdcUHBABSE4535k4NzoX7+FdOc4XepmjaqgO+H9hndG2znnWH5z2WNgG43zlpTse5uy+
	3mBU7p8fzn92eoQFSWUMro/rLl434eWDeF6zNQ5Tdtx3G3d+7KCU91cv4izs9sihxhQ==
X-Gm-Gg: ATEYQzxk/F2xXQ1HBrHL41VmzrXYrWH9M0gYkU33kcSmnqu4dZqP5S7mkNrddoyGdIv
	fYDLFqtj+xHhV3mRufsQS2yGpm8lJwkb3LEXqCilluomKGL8A2NZ/KzQep2ybocptSMbyhpTsuL
	8SfySRfP3UXU096tuwzhf3Y56ZKv8gjaO2w+HIKUW9Y9Kt9M10dJ0T23OEDu2okkGSmsuPwVC3l
	hh1SS8Sq5HDwB0USHlRZYi7VNpPxqQMRrqCUJFXZswpJ9agMm2QU8jsi2eUvpZP/lmEGzxK2zB1
	JYjS3AaImkfpvvEsnwf2DfnTyvJWhtXfl682TiOvuloJ2yXF78Oid9MHdCQbZal5BqtsTAgFJ+H
	XMNeV32gMCjZ2KLURB3mCvUzFAMYv+wmVDZ7IywVx/E0tgPkk0oXzOvo=
X-Received: by 2002:a05:7300:d4cb:b0:2b7:f2e5:11a4 with SMTP id 5a478bee46e88-2bd7b89c2b7mr4123696eec.16.1771904379564;
        Mon, 23 Feb 2026 19:39:39 -0800 (PST)
X-Received: by 2002:a05:7300:d4cb:b0:2b7:f2e5:11a4 with SMTP id 5a478bee46e88-2bd7b89c2b7mr4123681eec.16.1771904379070;
        Mon, 23 Feb 2026 19:39:39 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da47778sm6089378eec.6.2026.02.23.19.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 19:39:38 -0800 (PST)
Message-ID: <cac08f2f-73b0-4629-898a-1e24840910fd@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:39:37 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyOSBTYWx0ZWRfX9US/zBQBNSiQ
 TdYYuaJ8BsPuJ0/ItexAdekd8/WmAi4BSEZl3Tp9QqrLjlWpBsNgjqbTHqSQTJ8sHxr5V/dg3Dl
 n+6a3gS1X4CTdETtfEBnsa/v4SBzJGXPn4wQnT85XFt6L53cR+LgX0QQAbm/FuxT4oYTjLkdJjb
 D7PlUOonkt0zNEHxFRGho5ElHkC5FwZeaUG/rW6O/Pl1aBHj6eL+Ik8hZ5ub80pqvhTDbpPOrdw
 UzDE+nDSFS0OTPx8POLUareIL2N3xjhrWaUHPILZT2oxiI743jLspKyiNnmK+KDXJiL1yFaDQme
 SOApRyht+UAAb1sNLaFnTJ9AZJaJJD4tSi8jpAT3jRnj8J4tDeLak4dS8wPx1k3H2bkr811hf9w
 YlEYfisNNxIX86cXwYC8tFHykn0fPTA7fpDpStEaArFttnBwA+VC95RuuWeq+/k1Xiw2uJHmclo
 HZHnVnRGKZ9fTYztHBA==
X-Proofpoint-GUID: BTcpnE2Tm5u8aku6zBa5P-6TxvNUjXqH
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699d1d7c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=aquNE3KFXbjoS9wDYHgA:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: BTcpnE2Tm5u8aku6zBa5P-6TxvNUjXqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240029
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53260-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C9E6518170A
X-Rspamd-Action: no action

On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
> * Userspace Interface: While the driver provides a new DRM-based UAPI,
>   the underlying FastRPC protocol and DSP firmware interface remain
>   compatible. This ensures that DSP firmware and libraries continue to
>   work without modification.


This is not very clear and it is not explained properly in the 1st patch
where you document this driver. It doesn't talk about how older
UAPI based application will still work without any change
or recompilation. I prefer the same old binary to work w/ the new
DRM based interface without any changes (I don't know how that will be possible)
OR if recompilation + linking is needed then you need to provide the wrapper library.

---Trilok Soni

