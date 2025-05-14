Return-Path: <linux-media+bounces-32449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E354EAB6608
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 10:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73DF91B61619
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 08:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F4F156F45;
	Wed, 14 May 2025 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbZDBOjq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350141B414E
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211512; cv=none; b=oJ3TO1z+smKBvGxd+82xobz4uOYcqQnDHJIgRbj9t7B6JpqfaGl31oEa/zPL1AfJBIbDzAMgy1sRnDHyqvB4UuuVkuHd0b6Th4bO1LLOQuOiGz/G3lNVK2qttlt49KDnehWxv8+FNp4fTQmA7AT7vY/pKC2xNXO4lqdqw1KXuHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211512; c=relaxed/simple;
	bh=3FjiK9Py+KFZ8A7lxYuIUJrDPqPH3vJeLhJ4c+RMuFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxCDgrKABVKKfZd1JUELhIP9rqWQBBb4yX3Rblf3d3mkLXcdpYcEQkUnN6YP9sZ20uRvmgJGYZvBqAon9VouaEnEklNGLyRPoJjpscfgWeaxyS6ODNK4bW3xeciy4domwKzANdspV4U5n9FNKsmOa2yBkH43pzthWC+I3j+N6W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbZDBOjq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E29n5U009953
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 08:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XoCxYb4W8qSkrUYK6EIgUrD85EUHZsrC8nIo+W/LByI=; b=FbZDBOjquhaBlKt+
	eVW7g0JWTfwDntGdc4WwTi59TEbJGvCMJSpJ02XCxXZaJR4OURodqzohkWYr8pZF
	Sr8XomwZLS6UxryzzSJRZhKWabc+S/8ClPcoA1ziJvd7XsjS8ojnt3PZ5d8pb2g8
	gPi5u1VtonVjPTWwI3ad67TZH8zQOWQVJT/gOfWtb8cFk4xvMNUvnazcAO3PImZU
	baSx1E844Z6dZRvQ7DZ1EQXIugGpkp1q9DfQfIU7umC5mPgOjx79r+7jBg+K+o58
	BVUr7n+cPweiNIkejL8C4527gsYzYAIch9u4vNPKmPCpLEgbU6su1W5nWHJ138o+
	//3dOQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyhy3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 08:31:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f53c479adeso13955576d6.1
        for <linux-media@vger.kernel.org>; Wed, 14 May 2025 01:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211509; x=1747816309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoCxYb4W8qSkrUYK6EIgUrD85EUHZsrC8nIo+W/LByI=;
        b=HM0uzzkPXhSaPka4QUPfkQIuB+3OuLwDw+UsoOXMgBSVg0/RrhVKXzTm+BECFeXu8y
         /2PXjHm/OHNKssZhSqjJ3asdejoQToV91q/BU+Q4Vk9dSJjYkABpHwIl73NQY+NYIsra
         2uTZIa0zFOy4wr/DAabbDFCn9uIoTBrglFT2nYdoh9psaoK2uZ83OTD+1v6jvI1i1m69
         jHs753c12Ikqv7R3tsPGxuwal8HwbiDxdj3Od7PAbW/jp2MAiu8Ap1SNypnm4vWeppTq
         Q6Eq3zR9FWLKdI6kGcrIFgDa2AnmS4KRli+P3aGCiQ5Me6D7f/waHDUGIrhHMX3zY9Lc
         F7qg==
X-Forwarded-Encrypted: i=1; AJvYcCU6MtWMaPn4g4eVUBRLA/+Nw4S29dl1up3to7n2BdBFnHqBdeA7jT8jBnQG7JAW2tm+kuYUIq1o092rLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNLdfXKg1S/A4wFVZa5+yA/3KldD/Ek54+2HfQp7Aqk3z5k2g
	2HblupJt0rxsqiAiO/mCe5jBlBmYEp28gX9XQJ1kanjaVe7MgRprBhkxUVnzdTrs8tVq/4GA+D4
	pAmdKxx/ZzeqLdNe9ZuTbcxltvKeMp2EkhakJ5e6zyG3zRCUi8fgGh2xNRzFlJlrzjpUZ89NN85
	b6d/6/qNzQXSJP/fR+JxYJaY755+fsqzypQqTKGLWOwhMtxn4=
X-Gm-Gg: ASbGncsZEQz7YiX7gqoGhmB/BH4N8cR+haaRqLKlRvcmTL/Vfn2jElRgwo9Jbbqs/nA
	klaJdxvVlPbTQQybC+LT0hbwEKJLsqtfiD9o6hEaHf3SFlk9L8wehU0s9vRtMoo3Re/fYuRE=
X-Received: by 2002:ad4:5de4:0:b0:6f2:b9f4:3843 with SMTP id 6a1803df08f44-6f85b680b22mr98988836d6.22.1747211508766;
        Wed, 14 May 2025 01:31:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM1dW5kLun2O9A4CoSG2tlzJME3mshVNS81MGSYNXn2fLIeXa6h2cAfK0h38e907c7T2oR0RT/PKA4j04NolI=
X-Received: by 2002:ad4:5de4:0:b0:6f2:b9f4:3843 with SMTP id
 6a1803df08f44-6f85b680b22mr98988546d6.22.1747211508399; Wed, 14 May 2025
 01:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512154445.GA4523@pendragon.ideasonboard.com>
In-Reply-To: <20250512154445.GA4523@pendragon.ideasonboard.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 14 May 2025 10:31:37 +0200
X-Gm-Features: AX0GCFvEn2pBZiu0OQ_pZDG5dKYbVpJnAqSSxhU-ax939vpGowX76ta5foKmvqo
Message-ID: <CAFEp6-3OCQ-if8ET52vdNg+OrQR281Ad=egOEtzsSLqPWiZY+Q@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Logistics and agenda
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
        Andrej Gardijan <andrej.gardijan@tuta.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        David Plowman <david.plowman@raspberrypi.com>,
        Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Jerry Wu <jerry.w.hu@intel.com>,
        =?UTF-8?Q?Jesper_Taxb=C3=B8l?= <jesper@taxboel.dk>,
        Josuah Demangeon <me@josuah.net>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Naush Patuck <naush@raspberrypi.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Ricardo Ribalda <ricardo.ribalda@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Stefan Klug <stefan.klug@ideasonboard.com>,
        Will Robertson <w.robertson@cairnwater.com>,
        libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: hmeFw0GHGZ9mYcjNfRM3PAyDFUymijv8
X-Proofpoint-ORIG-GUID: hmeFw0GHGZ9mYcjNfRM3PAyDFUymijv8
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682454f6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=P1BnusSwAAAA:8 a=MjDnXUY7pJBbMcILOM0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA3NCBTYWx0ZWRfX+D1JlF6HVOc0
 My1+fcvKqBiZlvegryhIPK69/z0qQnMlicF5AOYwUgLrBVmDAzDT3rNMtLEzOwfBH/j5tVMorEG
 yLDQ0I/+56PHW/uRwsLZf54CHtBwqQrqVEnG1nCAi7b723u2OTwhU8IZ8LZblrJLE/tGv4c+ToM
 XiX8hPpNOVJsvvI3WVaxs94ad77bDqc9vIYaLxmIXhVmgu1rUpJm9GqZR9nDz652LYMGDMVVMIl
 gD4qjIniZHIH1rGVCdf4yFAiEQ1r/HUni9qK7JfZxoHEbp123Orxm2XNUrpOjbPMhAjhL/21t7V
 7POEKqZ9T4vNhTbD36kZ0sVzRU/QXeMyvnpBBjtoL8gtclZUULvtZknrns5zFBP4ZbEklYjHVZQ
 SP+ZGwkXF7XH43lFe4q7lsWL9qO3mQn/njsSQDDF3qAK1gX0Su2zHffWaog2ihtxf9op076z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=724 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140074

On Mon, May 12, 2025 at 5:45=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello everybody,
>
> I'm looking forward to seeing you all on Friday the 16th of May for the
> libcamera workshop. Here is the first agenda draft, along with logistic
> information for on-site and remote attendees.
>
> As all workshop agendas, this is tentative and we will adjust the exact
> timing depending on how the discussions progress.
>
> 09:00 - 09:10  Welcome and agenda bashing
> 09:10 - 09:40  Software ISP status and future plans (Hans de Goede)
> 09:40 - 10:00  Slowing down the soft ISP CPU implementation (Laurent Pinc=
hart)
> 10:00 - 10:30  Using a single IPA with multiple pipeline handlers (Hans d=
e Goede)
> 10:30 - 11:00  Break
> 11:00 - 11:45  Bayer reprocessing (David Plowman)
> 11:45 - 12:30  Startup frames (David Plowman)
> 12:30 - 13:30  Lunch
> 13:30 - 14:00  State of gstreamer support (Nicolas Dufresne)
> 14:00 - 14:30  Multi-context support (Nicolas Dufresne)
> 14:30 - 15:30  Per frame control (David Plowman)
> 15:30 - 16:00  Break
> 16:00 - 16:45  libcamera on Zephyr (Josuah Demangeon)
> 16:45 - 17:15  The importance of libcamera to WildCamera
> 17:15 - 17:45  TBD

Sorry, I'm late to the party as I missed the earlier announcement, do
you still have a seat available?

Regards,
Loic

