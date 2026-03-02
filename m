Return-Path: <linux-media+bounces-54084-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIWTDrV1pWkNBgYAu9opvQ
	(envelope-from <linux-media+bounces-54084-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 12:34:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 893031D78CC
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 12:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61E5C303F7E9
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 11:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90484363091;
	Mon,  2 Mar 2026 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dV5+sVM9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iKgJ/IEk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266FB35F8D2
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450931; cv=none; b=YWa/8GwuAtspiSHur8e3DMBDc4CidfYiKMJLrCp9sqcNuTUmfMq1hcwACHoCv1JHdgDCby9fdCqvKJMXJ8q9HEiUyger5rurPk4SYiox82SuBYseMDEtG0I9EYMJeGJPdH6iD7xaeOKBbeTWEvPyn0auFtQszYQ8wO41H3WA4Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450931; c=relaxed/simple;
	bh=zhTy70SQvMrYMpy7wUiartOZ8/7wV++oycrtdPGEz2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lh6dQUj8+75cANMsOnYXOLybhkzVC+8W7nZ5j/WVmR+YzHDaL2vI6L74a3PDlXsP64y4AWOUTibSMtgLDEP694Era8CaDHCoz0OBSivwaL/zOqBasvW+EuSp1o6GxVNOh7Xba1oGqPtCAIsZdL5MqdJ/x56kCn4EdHegBWsbxY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dV5+sVM9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iKgJ/IEk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229JZOZ3742101
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 11:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvEutWDyx6cWWg5BlpLIPhhjEpxjm98tCmHGFTyWrD8=; b=dV5+sVM9rL+8TE30
	eYOW1b97a1PZ3UkSSjvTakxOwfXJGG9Nip3ZRL/RBRf6NoFvWsGEbud5ncDpS4LT
	KWa896A9DqFluQ3oAvKryX7HGvout6QuxnEoHcF8HzYnmWzG2jGUiTyWr/4HVz6T
	YptpWhCyxF0OO50eERpTobjDMUXveypK77kfyNgvIIEszdqgEd4CDmWtzr3xRF1d
	8qzjiRd1rYMWeqeBQFoWPQg+V2ZxbWEvUZxG0l1jA4NJzXA9QaPz5Up5mX+KpmdE
	Ogr83CWK0pDZtUvsRbf4u6K68XpqWVi9iMC3YKLV2mOLqv5g7XUot5tAzcCaJ/lG
	TV/IAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trgefu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 11:28:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506a936d7afso549478521cf.3
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 03:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772450927; x=1773055727; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mvEutWDyx6cWWg5BlpLIPhhjEpxjm98tCmHGFTyWrD8=;
        b=iKgJ/IEkMY7AXYYpebIzRkUCtDJi4dwNw6ponk7vizLlQweGAw69thjBDlLQ4GWXu1
         BTsnZ8LF5hvj1derNbvMZO6G8MgkRBz23E4YjKSXX3IvWnBUYJaSaqRLxICvJ/7AlJyk
         oPwx/2w0iw5YM3peE/aGqQHUCK6xzJEN6lWNyJIMNubKNqjpt4MS93B2GD1ia8xBZbyq
         RNQhyHih23fMa+sPxE4hFAeyAUf308dfPVvvmmDEhfZxZT/tLGQgsUGzHkxx3bhjDppJ
         w+MoPYbX3q/coF/YzzN4u1gdaysoluathIRMNvMjFMukamFwJ27MtGrPwPZLW7B3Db+t
         ji6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450927; x=1773055727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvEutWDyx6cWWg5BlpLIPhhjEpxjm98tCmHGFTyWrD8=;
        b=CMYjqZoat/xBgcAgmgW/7+Wh/rnjAfAd/KUEPZibwcwbY2KgoT1fzkVZpWs0qouMlz
         3n64G8EUWKxV6Zmuv+0WnkPIOEXpYJVoAGs2vvyAnp2AN52Pz1UTsvxYiCC1+dhmYjnA
         cORdn+IvPvCVYp8oIvI7xrlYuPMqLYKRl6NAQWgTA4gWIfM1UNU6rhuq9Blf2xxaNg9K
         dURwACKjFvh+GBMVUlhGn4yxll2GDRLBvEjKxtd9NJxBDc7rEJvpws/QwxVubnVAUZJi
         eoZOuwxNMy7i/3PEe0cVLNxdtxULbwIfhROjBrXWZYfBPyerDBTstOReB7DQDbAg8tkK
         usIA==
X-Forwarded-Encrypted: i=1; AJvYcCUw4aLBvD4d+GFgkG/DRkadeCfQ/5URm5Xb6k4zeyr6Q6SP/maOF9lPgaezHtDPQyQT/mUiO2PF86r9jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ6c/PjKjl6jQUUSLF+Sw5g9Y+7u8fWhceaMeHsQnALoqaODlP
	jYWBeZmG7ws9gpmxa1SqLWrVEBxGuWOZcMgvu359D1mOW2VWboFo/AVZL2rUr46Q/oXx+stNLD4
	0i6uvxHoRwAr0VBjunhREtlNDrSa4G0BUTTi5n9hJl3RfJOZhFhY9axxzCehqbrm/mA==
X-Gm-Gg: ATEYQzyFJMqYcmq6umJCwfh7KeWekUvDMfppSEnvYNCLoV2LLMcoMESBlUQqMh5fKuJ
	/81Q1fGfq26bMiZIwPD2vJ6+qR7pnbmzYl+AvybH1gKA47w1kzZXLtyQuloX1qDtoWEHI9CkzSc
	H9rQ7VLPmNTTtwBF5xOvcSK6mmqW+jW8Nj6mEuwi/oIEN80VhuaBtsVTKYy7OpEhAZgGrJYiEEF
	e3A5ae3yGdmXf0Bwig2p7xioMbihNsNZaVDUcLoZ4mBIe4qzKNgMSA4x5BrsB50rZcasnDNu6ic
	+TwNCXupE4e0HZQz26y6b63a6i247cbS0UD9sosftTVJVew6LqJwyUFXxVO7FpFngNLMZfP6FmN
	VJ8oWwn+E/OqFQegFG5Vxck9PBeGDtEkpL24Y8x/jfJneoBrXnRBs5Xh5CMQxn70cQChXNRFNFf
	BhkbZoC7zxYmsrn8JZopSkDPposZyP9YzU7fw=
X-Received: by 2002:a05:620a:258d:b0:8c6:de6f:898e with SMTP id af79cd13be357-8cbc8e55cbbmr1276081285a.9.1772450927382;
        Mon, 02 Mar 2026 03:28:47 -0800 (PST)
X-Received: by 2002:a05:620a:258d:b0:8c6:de6f:898e with SMTP id af79cd13be357-8cbc8e55cbbmr1276078985a.9.1772450926934;
        Mon, 02 Mar 2026 03:28:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd2704sm1640530e87.7.2026.03.02.03.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:28:46 -0800 (PST)
Date: Mon, 2 Mar 2026 13:28:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: allow interlaced video streams
Message-ID: <uis6txrcj2thbtkrk2u3w23orzzjkluuzynqcijpcix7zlsvz5@kyrmka6zwtyx>
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
 <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
 <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
 <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5NSBTYWx0ZWRfX1gOezdNLN796
 FCtSWl3s9NR6L5sLwPhA31ya/IbXqg+8RGRSTm3fYzbNeb+CXbYoUT4l1o+uOKyRos6EqwVaGCO
 QDcOrLoSwYcBQZZ+kiL9NTAihoUwHjEntj15JBFBZBbVnRzaPc65HWxlFeq/MK5H2Gz7zMtsel+
 1PaxR/qf18tr6XXNxoQGrN1Q23gnwEyshzSGttE7c2H39DgxT7PCuwANK2pEis+Ha3bdn9070+w
 2xfYvLtyWo8MJQ9yA/VMyi3Q8R+J2dXuhUsA5MDgyM4OmLmsSISwgdU3FYBbKDdlowy60mEL4cH
 QDqP/Z/b5sJpd02XRa+rVqY05EaV6F1hBBZL9or6qzQWWGCqRYMbHo1H2hIgS6C4Itd5O2LfAOH
 DcxnYgRtori7i/iqXpPP0ZHiRroJ8Rcf0493YkwFJpePur/Rxhcp576RWdkRHX9h0604t6SwZ4e
 ClAKt9P+j6jx9zhnhdQ==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a57470 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=1Z3fr9k91FHnsRC7eWsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3lKer3Z08afam_XoWq6ehA0VLThGLg_5
X-Proofpoint-GUID: 3lKer3Z08afam_XoWq6ehA0VLThGLg_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linaro.org,vger.kernel.org];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,sea.lore.kernel.org:server fail,qualcomm.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54084-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 893031D78CC
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 01:01:18PM +0530, Vikash Garodia wrote:
> 
> On 3/1/2026 4:05 AM, Dmitry Baryshkov wrote:
> > On Sat, Feb 28, 2026 at 09:54:20PM +0100, Piotr Oniszczuk wrote:
> > > 
> > > 
> > > > Wiadomość napisana przez Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> w dniu 28 lut 2026, o godz. 10:49:
> > > > 
> > > > Venus driver errors out on the interlaced streams with the 'field isn't
> > > > supported' error message, which e.g. prevents decoding of the MPEG2
> > > > video streams. Don't error out if the buffer is set to contain
> > > > interlaced data.
> > > > 
> > > > Tested with the fluster enabled to handle MPEG2 through Gstreamer:
> > > > 

[...]

> > > > 
> > > Dmitry,
> > > I applied this on 6.19.4 mainline and give run with interlaced content (hd tv) on qcs6490 (radxa dragon sbc).
> > > Playback fails like this: https://gist.github.com/warpme/a368983678af0a76af85314808773076
> > > pls see a bootom kernel output showing venus failure.
> > > my sw stack plays ok on e.g rpi4 stateful v4l2m2m so i think root cause isn't in my userspace....
> > > pls let me know if anything extra is required to fix venus decoder issue.
> > > br
> > 
> > 
> > Interesting. So, most likely, H.264 decoder can't cope with it and we
> > need to allow non-NONE fields only for MPEG2. Let's see if Vikash will
> > have any other ideas.
> > 
> 
> Venus should already support h264 interlace.

I guess, the question is: do we support interlaced H.264 streams?

> 
> Piotr, do you see the same failure without this patch ?
> 
> Regards,
> Vikash

-- 
With best wishes
Dmitry

