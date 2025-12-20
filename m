Return-Path: <linux-media+bounces-49246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90107CD3607
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 20:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16498300FE03
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 19:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712CB29A9FE;
	Sat, 20 Dec 2025 19:22:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8336D24169D
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766258562; cv=none; b=qV0g5U2Q5lZywF+RdnxKNlzvV51oYwngz25zuziF2pw9Ubo2wL7mO6odVOvjotmwE4G3ScrcKPjOx91mNNu1ejBIfh88E7cMA++eG3hYYxf8ujKfWshSQjIOlqkKQ6EJqBglBsZ+0GQ1Ub7dtHQoH5Fafp3zoO6woCgaaqIjdlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766258562; c=relaxed/simple;
	bh=aPQ85anu1Ii9wOobTneYzg/6ZS5Hyrvmo96LnNAxUbQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=abJgL6uW3Cd7zjtr3XRjoUsu60swlNzm0NCbolnh60hGst8Ci4JCGsfQcADJO18GtK2lSWJ6WxWenanCbaVxI9gYiBt0jLEnW1TDj9nxM9eZQCMOeS8tjxutQsLH6BYUtM6z/IUxo5UQR2Sb5kj1DXyFA7n3rgAXVxU5hwWDjFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7c7028db074so6031150a34.1
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 11:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766258559; x=1766863359;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXBuMKsbM+KwTrBICDHBdfzXtgBQf2h5Z/6bZ4D2vbk=;
        b=FTVtAwvHg0vH5GF8KVGZMTKEO4p5WUh+D7NLv/4Y8HRXPP25jJjZSgdmR3m6fefo4F
         Ndo3k4Ec0PYgIJi0JKqut9lvDJUJiPdcJccSUUQg7xqRRHGvW16+lm/qNiVe3papDjwo
         U9nO0lIB6h78vRZ6vaLpSjXLO+WnYgT9cH4n64UjfbKssxiqYNh4YH5jE7cEtt4QXJ8C
         FtR01Mlm9TV2Km2/jmG6YAISbqJNwcXxvx+k0+VlyYe2Q9Wo5tPzqb7C6RBWnpa9UBAD
         6sBOX6xZhfAdQqucVyc9f4fyXJDQZCXDLsCKc4dLIPQw/OlqabYpQ0/uR3TplgACsHxO
         y0+w==
X-Forwarded-Encrypted: i=1; AJvYcCXmc0aG4CiZFWgVE2UBrzLRnsxei9+i4U3C0N+yvoSqB5NtvrtTTFUP8V1fZcZGAPwtMHyq5ih5msotDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBIRN8ZjEQqnw0BrEshVS2go8bf57EAb0zERIJimmtjkXNEA2S
	hfcgOHmjUt14IGNHVsOTWjBdA6pWx6Xsr4pnkcSPboSw8gbR07tQuNfjw6zcGtLek0WM0lpdvrA
	eHcK0u4cJT24du0JH6pEMW/0mKivCSHeAMyiKYigbRyDbbqeV7SqNdrCbJcg=
X-Google-Smtp-Source: AGHT+IEFvvW4sFfICXsBjWL7HLiwQzByWYxuBpxiryOzRSkiF+Rs7HQiqXIBG29DxZUQGipiZQleuih4ce9em2r6jbf6FZrMgkh0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2291:b0:659:9a49:8f25 with SMTP id
 006d021491bc7-65d0ea9c905mr2793790eaf.54.1766258559494; Sat, 20 Dec 2025
 11:22:39 -0800 (PST)
Date: Sat, 20 Dec 2025 11:22:39 -0800
In-Reply-To: <20251220192210.399423-1-szymonwilczek@gmx.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6946f77f.050a0220.1b4e0c.0023.GAE@google.com>
Subject: Re: [PATCH] dma-buf: fix WARNING in dma_buf_vmap
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: szymonwilczek@gmx.com
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	syzkaller-bugs@googlegroups.com, szymonwilczek@gmx.com
Content-Type: text/plain; charset="UTF-8"

> When a driver's vmap callback returns an error (e.g. -ENOMEM), dma_buf_vmap()
> triggers a WARN_ON_ONCE(). This is incorrect as vmap operations can legitimately
> fail due to resource exhaustion or other transient conditions, as documented.
>
> Fix this by removing the WARN_ON_ONCE(). The error code is already correctly
> propagated to the caller.
>
> Reported-by: syzbot+cd944c467e4d4bc24cf6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug\?extid\=4317d7108e14e5d56308
> Signed-off-by: Szymon Wilczek <szymonwilczek@gmx.com>
> ---
>  drivers/dma-buf/dma-buf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index edaa9e4ee4ae..14b55f67ee1c 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1525,7 +1525,7 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>  	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
>  
>  	ret = dmabuf->ops->vmap(dmabuf, &ptr);
> -	if (WARN_ON_ONCE(ret))
> +	if (ret)
>  		return ret;
>  
>  	dmabuf->vmap_ptr = ptr;
> -- 
> 2.52.0
>

I see the command but can't find the corresponding bug.
The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
but the HASH does not correspond to any known bug.
Please double check the address.


