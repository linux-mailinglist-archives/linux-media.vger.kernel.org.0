Return-Path: <linux-media+bounces-15787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E73A69480BC
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 19:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158361C20D89
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 17:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CFF15F3FB;
	Mon,  5 Aug 2024 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="jZPoKI/a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B7415D5D9
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 17:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880416; cv=none; b=rU/rcvCOL3vesTiFkJyvuHtZcY3Ap+Gg3Kwa1panOtOuVJYtSQub7rgdUWBgIaO2ZaREGEyBbhvGc2ZeMlqus/hgShdzBKOP0j44tKTMMXvgL6zlpE6zSlw3G5d9efAeBPWEKZdtPoNAqzv0x2U47S3j3p2F/4eD5iBQ/Qt4V2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880416; c=relaxed/simple;
	bh=+r55UdWZ+cydP1+pWYoF8GZVJw2ikt7Bt3dHiqYNlj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AK2UmwxrCnd2lCfTA9FDMqJ3Vfvlu8ZWnEyqxcQBn4D3JzyNTJAlKeWBPs3LBL9E6OwTUQ5/vPyI+JUHAQ+TyXAXZNTY2+NMfF3zIFtvDBq1opnivE1QA4npipl9hXXLQCHHHQIQAyrIkT2ytHFVpV76EvgsbCSly+CHMIu2AcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=jZPoKI/a; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a22874fcfdso7155a12.0
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2024 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1722880413; x=1723485213; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cEa+YT/mVCcUD9GpjPevIJZLtJmVc6lmcDDNejfBO+w=;
        b=jZPoKI/acK3ub4p3JcY9/RxpulJMknmEQpj+IA03yHirZvbNipbCXPJ7LN1YBuYYw9
         T0UCMvf0XMTqeBWCAagnk2bSpjBjjYMbBtcXdW3AY3afQcFUfcAyl4g9LIntvJicYZmL
         22tpKBLm5IJGxhaA5l5tWeGgCe4mKe/Gm+Wh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722880413; x=1723485213;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEa+YT/mVCcUD9GpjPevIJZLtJmVc6lmcDDNejfBO+w=;
        b=h7CH3fDoHdazwNR4SIwq1XWX7LIr6cwvDlKJLJa/HUuMo9VSZ3sLIKmmlObpdt/G/5
         YmJSq9j6vv8ASifz4zA0Rs2tKy9BQxxlSjqbLX3CJCHBEL+k+JwsKHWpwPp9y0cNJ7gA
         1qMn0PdlAgAH6nwokP3f8K5AqutlgsEGaYn9u6zAzheJLLONddVs7GeBHqO7DX6uruZB
         4+otL6HfnAw4ODnsT/18WW99Wf5evFm82j8SFnh2S5GU06d1GzHuswd8HitUtcga4GxN
         dKmxliRGbhkoQuGwQuO8DLfbNIebx06LXdPnTPzAV31wekwr3j8d9K9cqZcL/aomSb4t
         KzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo52IpeHabKSJIgD2XYvVx4XsqKY31VPQjTtnYllCNTc6DCuRxnwdIbGCbD4UhVD47IbcOtcbNuPkFqHRMgNpy9rvFFrjUf3kK9rc=
X-Gm-Message-State: AOJu0YxKYAsI+E3YTIRcNHvov9URf5VMQcW0554TvlOTglZZ0vRNdEp8
	HW5igIryNtwFmPzyS8+wzg0RU/o5nw/FsmWyJBP9pdm90XBixaf6T5wVcsuFz4w=
X-Google-Smtp-Source: AGHT+IGlF5DiKdBDow/gpp4uHOITP01+3OGMKycpIkbo2FerV/n9VK31oyha5PyJpYnERo4T2I9irQ==
X-Received: by 2002:a17:907:3f29:b0:a72:499a:e5ba with SMTP id a640c23a62f3a-a7dc50f07d0mr706646266b.7.1722880412461;
        Mon, 05 Aug 2024 10:53:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bcc86asm472899466b.28.2024.08.05.10.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:53:31 -0700 (PDT)
Date: Mon, 5 Aug 2024 19:53:30 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Huan Yang <link@vivo.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
Message-ID: <ZrERmndxBS5xUvuE@phenom.ffwll.local>
Mail-Followup-To: Huan Yang <link@vivo.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <Zqiqv7fomIp1IPS_@phenom.ffwll.local>
 <25cf34bd-b11f-4097-87b5-39e6b4a27d85@vivo.com>
 <37b07e69-df85-45fc-888d-54cb7c4be97a@vivo.com>
 <Zqqing7M2notp6Ou@phenom.ffwll.local>
 <4e83734a-d0cf-4f8a-9731-d370e1064d65@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e83734a-d0cf-4f8a-9731-d370e1064d65@vivo.com>
X-Operating-System: Linux phenom 6.9.10-amd64 

On Thu, Aug 01, 2024 at 10:53:45AM +0800, Huan Yang wrote:
> 
> 在 2024/8/1 4:46, Daniel Vetter 写道:
> > On Tue, Jul 30, 2024 at 08:04:04PM +0800, Huan Yang wrote:
> > > 在 2024/7/30 17:05, Huan Yang 写道:
> > > > 在 2024/7/30 16:56, Daniel Vetter 写道:
> > > > > [????????? daniel.vetter@ffwll.ch ?????????
> > > > > https://aka.ms/LearnAboutSenderIdentification?????????????]
> > > > > 
> > > > > On Tue, Jul 30, 2024 at 03:57:44PM +0800, Huan Yang wrote:
> > > > > > UDMA-BUF step:
> > > > > >     1. memfd_create
> > > > > >     2. open file(buffer/direct)
> > > > > >     3. udmabuf create
> > > > > >     4. mmap memfd
> > > > > >     5. read file into memfd vaddr
> > > > > Yeah this is really slow and the worst way to do it. You absolutely want
> > > > > to start _all_ the io before you start creating the dma-buf, ideally
> > > > > with
> > > > > everything running in parallel. But just starting the direct I/O with
> > > > > async and then creating the umdabuf should be a lot faster and avoid
> > > > That's greate,  Let me rephrase that, and please correct me if I'm wrong.
> > > > 
> > > > UDMA-BUF step:
> > > >    1. memfd_create
> > > >    2. mmap memfd
> > > >    3. open file(buffer/direct)
> > > >    4. start thread to async read
> > > >    3. udmabuf create
> > > > 
> > > > With this, can improve
> > > I just test with it. Step is:
> > > 
> > > UDMA-BUF step:
> > >    1. memfd_create
> > >    2. mmap memfd
> > >    3. open file(buffer/direct)
> > >    4. start thread to async read
> > >    5. udmabuf create
> > > 
> > >    6 . join wait
> > > 
> > > 3G file read all step cost 1,527,103,431ns, it's greate.
> > Ok that's almost the throughput of your patch set, which I think is close
> > enough. The remaining difference is probably just the mmap overhead, not
> > sure whether/how we can do direct i/o to an fd directly ... in principle
> > it's possible for any file that uses the standard pagecache.
> 
> Yes, for mmap, IMO, now that we get all folios and pin it. That's mean all
> pfn it's got when udmabuf created.
> 
> So, I think mmap with page fault is helpless for save memory but increase
> the mmap access cost.(maybe can save a little page table's memory)
> 
> I want to offer a patchset to remove it and more suitable for folios
> operate(And remove unpin list). And contains some fix patch.
> 
> I'll send it when I test it's good.
> 
> 
> About fd operation for direct I/O, maybe use sendfile or copy_file_range?
> 
> sendfile base pipe buffer, it's low performance when I test is.
> 
> copy_file_range can't work due to it's not the same file system.
> 
> So, I can't find other way to do it. Can someone give some suggestions?

Yeah direct I/O to pagecache without an mmap might be too niche to be
supported. Maybe io_uring has something, but I guess as unlikely as
anything else.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

