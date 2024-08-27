Return-Path: <linux-media+bounces-16941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A22096158A
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 19:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07122B23209
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 17:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254B11D1F71;
	Tue, 27 Aug 2024 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lRP/9w5M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253221D1739
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 17:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724779997; cv=none; b=dJqFaoMzLkERDBJblREUkI5ieq9BjnBAPPPFnKFOwAsPImjQf0ZgJiPUDvneaBJsuWBWAhTn+5L6bIR9qQ2rIPfGMtlPMR1KBTormz3/aSy1DTdiWk9W/yPD+Ns0oSvbKIO3dTNFI6wqxRPw9Fm4OqY/SRVVgSgldoricaodbZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724779997; c=relaxed/simple;
	bh=A9c9V/JjGYSj3qfCw1LwRU/YfPcwRcGhxoWRtehq9F4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5kect2C5XPyZnVKZltyj86SAMLugAsqLs8VRjHRQ0oeOlFsCJxlQz7RbsFCVB83Op4Q4FbwScvvbdK1Kg50F82njC47yQ06K2wbHzrza9C+UUjbfUhKGShM5KqSJfLC66w/fVPUfNgye4CjppWuGNlAkeQwlEzXHxFSb7oUsXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lRP/9w5M; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RFObX0009541;
	Tue, 27 Aug 2024 19:33:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=epV5xuu6EVenoOQPRbK0bccx
	MyQdU4Vn/me18GWtaIk=; b=lRP/9w5MqnKTXuJjWPVAhF8mq+j1h+mK0MM5e7vw
	Oe3Ro9D/7bPMqnZ7YjF/OJyv4jVTjWTdKSj4nFpRxmfI80dn0cYlmhs+XikvkFZn
	YQKzoP+tjj4QcAWRAqOB0o+BeC4QsflmSWqwgfByDcgO8vWq/PeE97wjsAOlF3pa
	he7V68aD9woZB2Pg9KSwuX0FNU1gTP9wQhgZaPIil7k6R3mLB/jKWDV3UoH0DfFb
	Kv++ps1jDVeR0bk3f9NhOnzo08P0iJsRrviUTTi9ltR+yapFQn77f6ksMIFylRyg
	FM1o4rra+fMrmS74FfcIItj2QbW1Cazrr2vLIe+hvpjT+A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 419hdvrc6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 19:33:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 87A144002D;
	Tue, 27 Aug 2024 19:33:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48865285A0F;
	Tue, 27 Aug 2024 19:32:47 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 27 Aug
 2024 19:32:46 +0200
Date: Tue, 27 Aug 2024 19:32:41 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: <libcamera-devel@lists.libcamera.org>, <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: Interest for a libcamera workshop in Vienna - September 17th
Message-ID: <20240827173241.GA1594588@gnbcxd0016.gnb.st.com>
References: <20240729090042.GA2725@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240729090042.GA2725@pendragon.ideasonboard.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_10,2024-08-27_01,2024-05-17_01

Hi Laurent,

thanks for proposal of this workshop.  I'd also like to attend.

Regards,
Alain

On Mon, Jul 29, 2024 at 12:00:42PM +0300, Laurent Pinchart wrote:
> Hello everybody,
> 
> Following the success of our workshop in Brussels in February, we would
> like to host another event in September.
> 
> We have evaluated different options, and opted for week 38 in Vienna.
> The city will host during that week the Linux Media Summit (Monday the
> 16th, [1]), OSS Europe (Monday the 16th to Wednesday the 18th, [2]) and
> the Linux Plumbers Conference (Wednesday the 18th to Friday the 20th,
> [3]), and we expect that co-locating with those events will ease travel
> for attendees of the libcamera workshop.
> 
> The week is already busy with camera-related events on Monday with the
> Linux Media Summit, and on Thursday afternoon with the Complex Camera
> micro-conference at LPC ([4]). We have therefore selected Tuesday the
> 17th for libcamera.
> 
> To help us plan the venue, could you please register your interest by
> replying to this e-mail, either publicly, or in private to Kieran and me
> ? The event will be free of charge for attendees.
> 
> Please also let us know if you have any preferred discussion topics you
> would like to include. We will draft and circulate an agenda in the next
> few weeks.
> 
> [1] https://lore.kernel.org/all/ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl/
> [2] https://events.linuxfoundation.org/open-source-summit-europe/
> [3] https://lpc.events/
> [4] https://lpc.events/event/18/sessions/193/
> 
> -- 
> Regards,
> 
> Laurent Pinchart

