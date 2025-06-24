Return-Path: <linux-media+bounces-35819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 401B1AE6E9E
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AB241748AF
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043EB2E613A;
	Tue, 24 Jun 2025 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1/Wgsvb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF5A22FF22
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 18:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750789891; cv=none; b=ReRJhe9Q0awskrG/7inefsXteVdNk8UNUINbg5upUwuDT8Vp/5hXb5LHHJHDz3beRpMvttcx9WpmtxNTEHmH8TP2f/HNbrqeR6MZUoaK48SRxfKsrdPclqEWjrp99f2Jy0vS0lNQorfRxyLq0xt0b3hZG3UTewG6w5xLBuE40Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750789891; c=relaxed/simple;
	bh=m8J3O7QzYtKHkTJW6LMTlN1rnZ3hXaZDwhHlnyjRWHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGvoAAlYCy7Lg+2cN5p+4ahVbIcRq2PxX13jkMQEmrxpfnkOkGm+Lc27fU9EG9LVaZVyldyqRgBgGxf7efy+ldAyl+Bj+otwEFcQkFmiyKHb/I8SuEijZ8rCXi7o/wklYxl1vldxs/lD0qa2gNLgSnOkjaT0NYqY/0tSbZbig0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1/Wgsvb; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4067ac8f6cdso4440004b6e.2
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750789889; x=1751394689; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GjxEYQ1lbJWp4ECKZKQpz8oozPbUNKZGlrJ6EmAWMmk=;
        b=V1/WgsvbksR0gweco31aEBMw+5KQsjbsnRt8VFD7eN7CMlaN2YZ6lUkMRpD3YBgF1G
         qCk8LuBcCDQF6sTxEyNKn/EE0oaHCGDRpWmqHEP2wOxcMzaPg5+ZJvmPiH5A4h9wlqVa
         SqK5zigWn5SPaSv8LtEL38pr8ShYl8YqSEqenDBukCXtQVIqpSUFS/dWIAgmZCMUFUpi
         w2fp/Bw7NHYklTolWIoq7SqBuSEbKir8MVoVg81l0B85fbLx/KdGfDnCCMfvWtff6xQ/
         ELN8M8W7Ve+FIpbloOrZCBTICFCIOYeilORbqDAD7akGtCCOFrLVP04wH8ZEVaSRE0Ck
         QFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750789889; x=1751394689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjxEYQ1lbJWp4ECKZKQpz8oozPbUNKZGlrJ6EmAWMmk=;
        b=eCZ59Z/H+LY2l4Pl01Pk/Gb/RQ1U1Wq91kQs5CxqqOFa0jjYcEdVzdTNBXf1gJ+A+n
         gdFq8hzm2JdoJJyLCPq8q0KAuACNWlW5tsgqiAZA9R5XQiaw31dHzmJn1EjK42aKpgpQ
         blPAGAEmbJ/4H9GEwnM+jFm2UdkqynucEIF7yoZ5a3fAG5v9pTsnIqSOe6kpnXgqylf6
         KBAkwWwPTIk8YYdS0qPF8VRqaiw4LE0G2wsWjt4x5vPPIntNTDEgNpjJ3KNf+hiaa955
         wVYKTByCVzdghb34jO8vSoR5oXUNr+E5O3/ga3X7ri6rG3feCzzAG/F1Knw++IqtVukp
         ZsSw==
X-Forwarded-Encrypted: i=1; AJvYcCWfVzblYioceOoJVxonfEgQn1lUCG9HlCg8UZFbNk9kczK9ZGRRvJggPd532FHLdgr/CdpWCES64hzg+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsEyaWrFyNLKCHlnwOt+sMZxRc9TNQaO02ngO0zVTddxbX7ZSV
	Kp2gHaUF8qi1hPiezV3odDq3U0ZsB/33rGfqTa+FajaM2iiCKeG6nmbGYgzQn4L9vno=
X-Gm-Gg: ASbGncsDyv17kU1U/QBjwL+3HnQn3U0mtJyi37hkohMfBE96d9RnMgnaY8dcOPTkFJz
	gInKHDW3G778COmsl6erNq3hnRSHxwgA8MhcmXfSqNtTyri8EJBF6I5vPbaCOuLwG8y7ULNcUsP
	AT1efhKild0/fINA2pi19jBMCbq0JBPXnCE4bKPjqEBCGKb1bRwxenSjb5zBKhnQnQRxvagSvgK
	c/G0Wj5NxS+iHOEFvh8T4/eLH5PTe9L/0X2BjYkq+mUXnL9t/RuOpuBzFGJi+hfyNnqCeLbed3U
	OzCJHd3YNS/c7Je/VumUjILNQnNWdOaZhBFPSEHSPO90oBRiuodb1uGu93DyPeKKkN6/PQ==
X-Google-Smtp-Source: AGHT+IFwefbh7k0nvQhczietm5nprEfi0G1/PBzQxhLLmXWhfFEBYvdG9Ik5OraSPjQQOjmjLaMTJA==
X-Received: by 2002:a05:6808:d4e:b0:3f9:76d2:e437 with SMTP id 5614622812f47-40b05bf2641mr317669b6e.20.1750789888699;
        Tue, 24 Jun 2025 11:31:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6c30481sm1893573b6e.17.2025.06.24.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:31:28 -0700 (PDT)
Date: Tue, 24 Jun 2025 21:31:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <5d579b8c-0676-46d8-a020-77ee91e1e7d3@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
 <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
 <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
 <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>

On Tue, Jun 24, 2025 at 08:49:36PM +0300, Abdelrahman Fekry wrote:
> On Tue, Jun 24, 2025 at 8:32 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, Jun 24, 2025 at 07:51:10PM +0300, Abdelrahman Fekry wrote:
> > > On Tue, Jun 24, 2025 at 7:31 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > >
> > > > On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
> > > > >  int hmm_init(void)
> > > > >  {
> > > > >       int ret;
> > > > > @@ -130,14 +48,6 @@ int hmm_init(void)
> > > > >        */
> > > > >       dummy_ptr = hmm_alloc(1);
> > > > >
> > > > > -     if (!ret) {
> > > > > -             ret = sysfs_create_group(&atomisp_dev->kobj,
> > > > > -                                      atomisp_attribute_group);
> > > > > -             if (ret)
> > > > > -                     dev_err(atomisp_dev,
> > > > > -                             "%s Failed to create sysfs\n", __func__);
> > > > > -     }
> > > > > -
> > > > >       return ret;
> > > >
> > > >
> > > > It's really unclear how this "return ret;" is supposed to work.  Was
> > > > that part of the sysfs_create_group()?
> > > >
> > > yes , but still it can be set by hmm_bo_device_init so even after removing
> > > sysfs_create_group , ret value depends on another function.
> > >
> >
> > You're in too big of a hurry.  Wait for a day between resending patches.
> > I have looked at this some more and it turns out that nothing checks the
> > error code so the "return ret;" doesn't work.  What do you think we
> > should do?
> >
> sorry , will keep the time issue in mind.
> regarding the "return ret", its now basically returning the error code of
> hmm_bo_device_init () inside the function , but outside the function
> scope like you mentioned, no function call to the hmm_init() checks
> the error code. Thats what you mean right ?

Yes.  Nothing is checking for if hmm_init() fails.  Step through the
code and verify that nothing crashes or bad happens as a result.

For example, I think hmm_bo_alloc() will print "hmm_bo_device not inited
yet." and return.  So that's kind of annoying but it's not a crash.
Search through the rest of the driver and verify how it will behave.

regards,
dan carpenter

