Return-Path: <linux-media+bounces-10790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F48BC272
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 18:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52171B20D58
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 16:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A633B297;
	Sun,  5 May 2024 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ggpSEO1U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE21862C;
	Sun,  5 May 2024 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714926062; cv=none; b=WWb5Dohb2A3PnqPezSXuzhOzyNOY2FHX0lpprS+92mMRbCYkbZiTtfsVIEaH4ZLdFBrl4GOHq9bkxDt74dClTS2AjCnxyF5wDUjS9LQWdawNGDR7AJjVBpAhQHho4hmxXS6/Ht9llGSmvJgdKwu+ypoVNWQY/CVJu2lCdX9TSVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714926062; c=relaxed/simple;
	bh=fn1Y0Fvalw3p2xiNGMYhBKwqheSpAJk7ixl8Wk8aamo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X88XNBAIohm2rRvb5B3Y0nUFPAp4x9d+0vP4ygPku7h/XPUks9eWDirexnWa95ki40g+/MgN5gdoFca8O6QlMarLGq1e5ntNM/4YFwhsM3MJvxnOVG60bFl5SRoSyNQOZtI1yzycbB2y5TfR8xdG0uWDyypoycl6WAaVoOuj8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ggpSEO1U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 445GKsoH001827;
	Sun, 5 May 2024 16:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=f16PTek0Bmvx5v9zUadis064ktYQgiNdbOEhCsQmxFI=; b=gg
	pSEO1Ul1EY/ocAyYmnQOEI2R7EhbzsAypkD23jtGUaV4m151AfX6ayNiS8lprywO
	p4LDv0osm6nOW/XpvzlOPugEBepwEHUCNEzvsDHz2J/j54sFhJnmAyhxg4PCB9Bz
	3M4b6AGZf0AQTscN1vz95rbrsdhOPkOcJxYtdQ7T67729CH8vU4bUETDaXe3xNY7
	s9FHfHbixHskOWRGyclGnvKOhhx/sXnjUNUjChqqNT1GuGLUlZ6m7fhBf3cWTVtL
	kP8equFHH4sttbTRGeUqyAbljpK5wtYuoeC3iOPs1cKqz2V3bpVNhjpx0Vzqr/VA
	tmU7/SHCwQ89YNgZYPFw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xwdsmsw2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 05 May 2024 16:20:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 445GKLO6028359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 5 May 2024 16:20:21 GMT
Received: from [10.216.45.66] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 5 May 2024
 09:20:18 -0700
Message-ID: <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com>
Date: Sun, 5 May 2024 21:50:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>
CC: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        zhiguojiang
	<justinjiang@vivo.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <opensource.kernel@vivo.com>
References: <20240327022903.776-1-justinjiang@vivo.com>
 <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
 <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
 <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
 <e55cad9b-a361-4d27-a351-f6a4f5b8b734@vivo.com>
 <40ac02bb-efe2-4f52-a4f2-7b56d9b93d2c@amd.com>
 <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
 <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
 <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u7R16SvhkSPx1h5AvS-rjsiofvcdveX_
X-Proofpoint-ORIG-GUID: u7R16SvhkSPx1h5AvS-rjsiofvcdveX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-05_11,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxlogscore=853 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405050073

Thanks T.J for the reply!!

On 5/4/2024 4:43 AM, T.J. Mercier wrote:
> It looks like a similar conclusion about epoll was reached at:
> https://lore.kernel.org/all/a87d7ef8-2c59-4dc5-ba0a-b821d1effc72@amd.com/
> 
I am unaware of this discussion. Thanks...

> I agree with Christian that it should not be possible for the file to
> be freed while inside dma_buf_poll. Aside from causing problems in
> dma_buf_poll, ep_item_poll itself would have issues dereferencing the
> freed file pointer.
> 
Not sure about my understanding: ep_item_poll() always call the ->poll()
interface with a stable 'struct file' because of ep->mtx. This lock
ensures that:
   a) If eventpoll_release_file() get the ep->mtx first, ->poll()
corresponds to the epitem(target file) will never be called, because it
is removed from the rdlist.

   b) If ep_send_events() get the ep->mtx() first, ->poll() will get
called with a stable 'struct file', __but the refcount(->f_count) of a
file can be zero__. I am saying that this is stable because the 'struct
file' contents are still valid till we are in ->poll().

Can you/Christian help me with what I am missing here to say that
->poll() is receiving stale 'struct file*', please?

And, If you are convinced with above, I think, It should have been the
responsibility of ->poll() implementation to have taken refcount on a
file that is going to be still valid even after ->poll() exits. Incase
of dma_buf_poll() implementation, it took the refcount on a file that is
not going to be valid once the dma_buf_poll() exits(because of mentioned
race with the freeing of the 'struct file*').

So, in dma_buf_poll(), Should we be using atomic_long_inc_not_zero()
based implementation to take the refcount on a file?

Thanks,
Charan

