Return-Path: <linux-media+bounces-4129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9E83A2B4
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 08:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A02151F27483
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 07:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2DC1640B;
	Wed, 24 Jan 2024 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FgJYiAfb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D5E17585
	for <linux-media@vger.kernel.org>; Wed, 24 Jan 2024 07:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706080725; cv=none; b=WJocfEDwjGUJqlmLV2YoiMmAs3r3VBAXoz5oKPbrlc5muik1KDd4J8apFwCJlO/p6NhjB6uyLmA/odz/Z5qeW+L1Xs0ZnH0mWFEC+fl9ZRpdCpMtx4o7hUySuKY4OhzNgrXIgYSUhxuk+Eyw2E+sVy2Z3uiIK5H3SeoVdhprqQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706080725; c=relaxed/simple;
	bh=71eOmZO0ulV6cfaqT+FyuC81GGDTbXlSKMlhvZegt0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVm4Ep+OAGZFgncVf31yyyu6obHaEa2acAUo1yQvwfW3BiThq3k92zGdnHyBGKSedk7pu9op3PMpq75LiCIk8T0A6FnIVSW3YM3L6+og+PqY9IgCRGHTb8Dqmy8W4lf/xA7SlUy1/ZoGzjxMCr/zgakBg5yN9HOLr1fT5clqoZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FgJYiAfb; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5999f3f6ce9so1324545eaf.0
        for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 23:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706080722; x=1706685522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RNfYUFcKSC6xPohtnPlkVi+YuKVyII1W6NydAOyy3Ss=;
        b=FgJYiAfbRwQBUQntX3CmwLi8gCHJReWKv09dEtDe4i7jfbV5HSsOTFVHQ4i1zC8Uf7
         gsMzXjX0pp+iFRKabSzPPNFCm9J5nADgvds5/u5H6YlXlVo/e4x6cvqtrZusejSjh+Je
         WQZd0h1V7nZMW9HjxFlTjyc8fbwvCFEcVIKDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706080722; x=1706685522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNfYUFcKSC6xPohtnPlkVi+YuKVyII1W6NydAOyy3Ss=;
        b=CWYpAUkFmSWbbRcF5uzukwaWTS+hz4DHrOoRIwuhpet1LZA6WSqbK/XD+7i/na07dy
         rH82LXU/vWdJPno6+0YvlEEpVjH1GWCYIZ1x0Nv8RzrbWMmyppIEjQbqytM1s8aBI2ly
         pivc+n+Ikzv47tY41cHMbLJuoAECiTNp5F92syVernFi4bzFNodOIC3yK5Sy9UtxHUny
         Gl9eDx2V9xqWG/A2cuXX2XFNVuM0qraYUlNM52xrK62Vr5BMpua7OBMxZACfbdsL7p+n
         YW4VBYB7/5Wxjvnjhtnr0i7R9hxDI6Q7ht10FfVEzl0JabHnvlxwyahMph4p6sIqTO44
         e6yQ==
X-Gm-Message-State: AOJu0Yww4Xxpz7GUhUG7urzitYuMcjoaPccIF+GSi53+uZLdATixfl4X
	Xz3+EgNqcUFbTVW9stV0Exa+YLWmZ2EBiB3LJPh/Rrr7QPu7kSLtlVNFdUy1XvZz4hSGMizGwtQ
	=
X-Google-Smtp-Source: AGHT+IHmFQV4tUjvwpLtHtvXL7+At/hoP7SHXnty3hK4pMT4AK9fvh9mADHDzA+xbf3ZusLNbSMz8w==
X-Received: by 2002:a05:6358:d048:b0:175:4d29:ac23 with SMTP id jb8-20020a056358d04800b001754d29ac23mr8180805rwb.26.1706080722620;
        Tue, 23 Jan 2024 23:18:42 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:c82e:e7de:29c0:4acf])
        by smtp.gmail.com with ESMTPSA id y6-20020a170902ed4600b001d73ac05559sm5668105plb.184.2024.01.23.23.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:18:41 -0800 (PST)
Date: Wed, 24 Jan 2024 16:18:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Chen, Jason Z" <jason.z.chen@intel.com>
Cc: sakari.ailus@linux.intel.com, tfiga@chromium.org,
	bingbu.cao@linux.intel.com, linux-media@vger.kernel.org,
	andy.yeh@intel.com, qingwu.zhang@intel.com,
	senozhatsky@chromium.org
Subject: Re: [PATCH v5] media: ov08x40: Reduce start streaming time
Message-ID: <20240124071837.GA3976836@google.com>
References: <20240124033154.834344-1-jason.z.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124033154.834344-1-jason.z.chen@intel.com>

On (24/01/24 11:31), Chen, Jason Z wrote:
[..]
>  /* Write registers up to 4 at a time */
>  static int ov08x40_write_reg(struct ov08x40 *ov08x,
>  			     u16 reg, u32 len, u32 __val)
> @@ -2936,6 +1827,19 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
>  		return ret;
>  	}
>  
> +	/* Use i2c burst to write register on full size registers */
> +	if (ov08x->cur_mode->exposure_shift == 1) {
> +		ret = ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_FIRST_A,
> +					      OV08X40_REG_XTALK_LAST_A, 0x75);
> +		ret = ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_FIRST_B,
> +					      OV08X40_REG_XTALK_LAST_B, 0x75);

If we have to be pedantic then second ov08x40_burst_fill_regs()
overwrites whatever first ov08x40_burst_fill_regs() returns.

But it's unlikely to be a real problem.

