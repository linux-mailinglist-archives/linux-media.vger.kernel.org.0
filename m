Return-Path: <linux-media+bounces-42459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FC8B552A1
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 17:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BC9C188910F
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 15:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A34223DED;
	Fri, 12 Sep 2025 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JOk+27iZ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F17F1F8724
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689439; cv=none; b=LKDie9EuEwFEGngaNkO1p8VMWVgHSktbmluzKtBx5G+yZFaeuReJlzF4M/Tpan4WsDeBtb44CVfzsd/JlyKmGTBmuK/5T3r9MAlbXavGYqeG4tGP+lvH5X+z4n3q0Jb6MLV3rl6QytPH3nOfi/LleEVT9jX2g3Im4bEOlFLjX6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689439; c=relaxed/simple;
	bh=DS83X1AnvvzLm+bCai80VK+iKHbBFz40tJWSVtqRlZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6UfSehgFq/Y4yGG4Cw7pFTarmJ9eDYZATPHbuDabgUK9pr/IqV9N+bqhOPBacUJQBaSKWqbUksPjOC2aCnHQrawhiBNA9CyhtM0BFCjkUTWi7u/TM5Krn9qQNglKLmaDhejHtBeyu9DRvIOP0apOzBWLHT0hWpJz5V9dZ+zg+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JOk+27iZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757689437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ql70NaELGKTagorgJIq5i9FlqS1h8VPOM70ZysXf1/A=;
	b=JOk+27iZO6dJpGN5ToHxN5943WIV94n15EKC9ADLp9EeGDuwNcDXw78JDQXuIda/e3esiS
	FhH7G2czr+PKEuXeX6Wq6NRbvUSfa90ErbpS6ysDfDzvqX21nTAeIHDk0HrcZjiyi2Q5tq
	bVYquwAwX6aZOLfIOBcr5IoqXf2GoMQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-hRTGQj5aOq6TWZ-6VICu4g-1; Fri, 12 Sep 2025 11:03:56 -0400
X-MC-Unique: hRTGQj5aOq6TWZ-6VICu4g-1
X-Mimecast-MFC-AGG-ID: hRTGQj5aOq6TWZ-6VICu4g_1757689435
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-727551d15c4so41673067b3.0
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 08:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689435; x=1758294235;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ql70NaELGKTagorgJIq5i9FlqS1h8VPOM70ZysXf1/A=;
        b=LpmSKxUIG3pA/pN81/kt8R37dVQCRo+RybUHf0X2WShEa000JuBkUGI3xveRE6Vq1Y
         Iou4bJz5+DKGM7MWsr4lqNgXGndeLNwZ6BKNXVgq0lfvduIQu0y+g7ipaJr4UTIDcE5W
         LRkhDC5LKB+3lzT/fAdAtgddPD1A9NzYxORcq7xG8rFwSC3DAux2EIegVamdjhP92xD5
         XfBLIvvkHR/INea4vzwK+whn6xPaXQ+wLoO8s1Xa7Sgt9V+g+XYOTCiaKInQ0Rh7d+rF
         ObOt5Y9TbAuVrzSJW3ZcU/lf14RtiDCqtWBRQxhVd6a0646kbev/JocBjF/kpyC5zcBL
         LQyg==
X-Forwarded-Encrypted: i=1; AJvYcCWOn6aPk18eAUCNN6AgHXkEoV4ze4H9ubKeSqxekZeg1BR3eXcW5wjUIGjzn1kOYDjkDB8ZQacb+93TYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjKTXJu+aX+yN1wxkMVQkROzWGhbn0j/npm50j6gbfrTMSfAR8
	Hr0zoiuq3NZtBUv3qRB2v6C4HKmpS9ADmRrxRhTylKi+FXW89D8LZM1vKMgMxoTDh6RQUoW3YGf
	MYTp/Ju8ja1DLF3hycDcGLQgMpctisBWxmDkEMpAPktDZIGR9wDQR2VZDtKNr7yjQT+V5Vw15
X-Gm-Gg: ASbGncuuA+oJwtKY3laIcC/63S9CQvkrfeA0/71BZBfyVMUK4r5f7ogVLgqJog2dLJI
	zst0zIdVFiZ+aAO/bdkHJM2Wf5D62iAnQIy4d426wy2/FSI72Mk7OMisK/B8ys/+waMvCcl9F6f
	JCFtejR8yPVB6oE+VJwEuQ1bg9xmNhhyPSWTUC8whn5WAwO66FUnKNT9iNMqG7YnmX3ETyNx6j8
	Ll0OgL1M338ngfkc0tvtUqzHOJxc+q0+HndDF6Xu0HGxsSxakD30WMCGYUoH9J66iyqReqHE7PE
	bJ0KCfrXmtD6chcco8mUj9meQD7AdhJPczUH3QJrmACZM/jgJFq6SMu8W+cR7pONVDKNR78nRg1
	gIQXWksSdob7ZpaBAeudKzIHcNRV7yA==
X-Received: by 2002:a53:d30b:0:b0:5f3:317e:409c with SMTP id 956f58d0204a3-6232f8cb7ebmr4945696d50.0.1757689434729;
        Fri, 12 Sep 2025 08:03:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAX6xF2fAzdjMOvplSdvZGKXrlcHOORL6WIZPj+3wYjGbwX4wiucOJhgAsE3V0lTTyfzcHDw==
X-Received: by 2002:a53:d30b:0:b0:5f3:317e:409c with SMTP id 956f58d0204a3-6232f8cb7ebmr4945647d50.0.1757689434009;
        Fri, 12 Sep 2025 08:03:54 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820c88db181sm287951485a.4.2025.09.12.08.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:03:53 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:03:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: st: flexgen: remove unused compatible
Message-ID: <aMQ2VveE3hIgmOBI@redhat.com>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
 <20250912-master-v2-4-2c0b1b891c20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-master-v2-4-2c0b1b891c20@gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Sep 12, 2025 at 01:36:11PM +0200, Raphael Gallais-Pou wrote:
> Following B2120 boards removal in commit dee546e1adef ("ARM: sti: drop
> B2120 board support"), several compatibles are left unused.  Remove
> them.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


