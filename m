Return-Path: <linux-media+bounces-40158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D47B2A6B7
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D07B77BACB0
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C557432144D;
	Mon, 18 Aug 2025 13:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wRx2Mkv9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC14220696
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524393; cv=none; b=ss7Umbgln8tZhkGpnQrkR3OVpt9LSIxIMrQzzV1vV/nNc6D2vGKJ6VxIKDfA1DmIPNkg4cJ5/vms9ewEOUaUW9ZwGYexw7HbdOEGZlAcA1LVlpFLmVMMLfEdbUpkL6qhspr1KLDCVMsMAMKX6cEjFONAxXhNPIAztrtxTIn+oqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524393; c=relaxed/simple;
	bh=AI6v7kPfWMA+miNg7wbOZdVUU4EmkESLIotA5sBin+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyl1I8ucxWwMFC4+8vRUf9zpVGx2mO34sPLNix+F8HNsKxn7SZtsi4+CS6Ju950zI45v3qRLIM7x73ZySLcXTxsUG5JTTFQwMY7NoYHpp0FRbSr9Z7Yeqzvqy78ptNDySNwUKkuE+UqxTdbyVU6pQzWK0cL9+uhB6A9phV9X7u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wRx2Mkv9; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e8704c52b3so503326585a.1
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 06:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755524390; x=1756129190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FJZQTHKlHSqbl45CU5FPQQ9yzybUQR3l/MQNkEVJRhY=;
        b=wRx2Mkv9zLt0nIGnCW77nBfsTVYRAg2ety6hMo+mZfJE2rRcVM3JeOndPWXK4dIeoa
         3mlgAVprmbr60nMjsQE4IDRt4jpJfbE8pWk+MtBhnB2pfPxv04+VHJjGt4OdpK2yTDx4
         mmz/A9pboKrGcQB+T4iZnJ1SCnHE7STETDk98/ACUqHRRUIQVygjJtAbzcUcE7cU7Hej
         m2652y+DijrCpYKTqIC7Fzg3/9QlvHNfSX48M9bTYqsBGUwLBdbrQyK3eDt/ddvT4BTx
         04mFpDoLi0+ce1nLXkOMqfTrliuuwOZs6RrpuoMnVNrYjJn7xPsiZ+1IdeJ1Z/zsfp2h
         CEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524390; x=1756129190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJZQTHKlHSqbl45CU5FPQQ9yzybUQR3l/MQNkEVJRhY=;
        b=dHDe7GYQFvdT9zy8oewl9mIlBHz3NygmY/7nl4+OBjagQqPWo7cPPgLIkkLo43LyQ1
         4Jbd+OtnnPeVT2Tm1Njc6VsCb7J9oRLlEuSqmhduQn6quuW3QuyFOX5YSTngQQETptbh
         UJuM9un0hxFvd47mJPm1NXkeYDVS49PFaSyTf0ZwvuBX2V5tu9cm7lFlXPT/5chF7Nhw
         NHllO4OaN73Kc+jSqsCKZNGd6dvGCCVtK4vkQ9uhpPnudh1Iutcsro8UKwf7Q7ZnxxKE
         yvqDQS5ixQ07KAURuFToUiOS8V9DtSVRSLXflBV6ZWFHC29Egpq5lBr4/CLDqbFWSKjw
         t79A==
X-Forwarded-Encrypted: i=1; AJvYcCV9vLkKV/+8xhEn7YvSBPw1r8qtFYXDOtjXTtPT21cBk3c8QjQhhY6EaixBCvbzDCR2a5M+niDbnqXwGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxP6dQHvGp6kViZcuG5thTSf6ndW4agZUUXD68aGxKscfLq1qv
	Ne4oAPv3d+3ucChbz0bm5m/NiHmdGNKouynarsb/ABst8jQHrSQy4rMfC9kCGIA+1Q==
X-Gm-Gg: ASbGnctMst1mzfrqKl66mMQtDYXBuvm+/PDHsrULthj9bGkLJQ3fzMgIvE9fYfPht3k
	gls7DuKdpaMs+d4NefhxXtCHl9xrrUesvSkJoM76Jp5FwC0J28o9QsPvyyofK7BWJzjHZPpCJlT
	/8NuYY2DWU/Tlw9oP57yRxTvwUmKGjCAWanQNnOOrVawa17+GyxpiQlQ5ahrdC/u3pbqCNwrvC/
	LVJ7l5iIIkiiPMTdaNV3Q2rm9NDo9YUJCh9PVS/HOjT50Mg/FNbCIXSgZRZk/yNpTKw0UIthuCd
	r9QdxarL3eSE7bQM9gRUFNNHUJ0sptDH6q54RyZnDaHyvdGkt4u4Fp0uU3lnkNuBQ/zR+pIf9/h
	2P84YKwR/F2lKHQTcTZEPGedQHSXD6clcjs2W12shWVcaK4OLV+A=
X-Google-Smtp-Source: AGHT+IEgkXGuq4e7M7fWzb2YB+PMFX6Ym9FJYxEKg3lgYKU5qsCNHsFfMVtFsUYrPZpoT3cKqxi19A==
X-Received: by 2002:a05:620a:700d:b0:7e8:911:2311 with SMTP id af79cd13be357-7e87e0ba56fmr1573344785a.53.1755524390460;
        Mon, 18 Aug 2025 06:39:50 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba90b8dc7sm52929266d6.30.2025.08.18.06.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 06:39:49 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:39:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	=?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>
Subject: Re: [PATCH v4 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <f8e186a9-015f-4df3-bc10-33eeef1146dd@rowland.harvard.edu>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
 <20250812132445.3185026-4-sakari.ailus@linux.intel.com>
 <20250813164958.6c6c34a4@foxbook>
 <aKLDXCchS20kaq20@kekkonen.localdomain>
 <767ac1c3-f09c-47cf-947d-968ae574e577@linux.intel.com>
 <aKMOBPTqZX_yJjOv@kekkonen.localdomain>
 <aKMY0XPLmK-TOWIt@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKMY0XPLmK-TOWIt@kekkonen.localdomain>

On Mon, Aug 18, 2025 at 12:13:05PM +0000, Sakari Ailus wrote:
> > > how about one of these:
> > > usb_endpoint_max_periodic_bytes()
> > > usb_endpoint_max_periodic_payload()
> > > usb_endpoint_max_periodic_bpi()
> > 
> > How about usb_endpoint_max_si_payload() ("si" being for service interval)?
> 
> I somehow missed your latter sentence earlier. I'm totally fine with these,
> perhaps I'm slightly leaning towards usb_endpoint_max_periodic_payload()
> but let's see what others think.

I'm okay with either usb_endpoint_max_periodic_bytes() or 
usb_endpoint_max_periodic_payload().

Alan Stern

