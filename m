Return-Path: <linux-media+bounces-49256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BEBCD396E
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 02:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23C1C301118C
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 01:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8A91B81D3;
	Sun, 21 Dec 2025 01:24:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608CC72617
	for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 01:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766280279; cv=none; b=WiOqeYyANyboyYnL9fTcAghm61CR4YdZdXix+GzCcDFjToetB1WWTOKSH+ta9fuUZuxbwwPkYGFWaDHQWDarWVVhx0buh4rot735SdSQc3pUNgzpGlRkjRJkKim/7vNlrDtYTSyQ4YYtY0gcPIZh8HXP6A0k1dw4x+gA4DM+nMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766280279; c=relaxed/simple;
	bh=yjmURZ02NkInLWmBt4N4e16gCowomv9XNsi8+HNJswg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=NEKmkHnR+81Pj+DnqsXOREWgcAAIkSOIko0At82d5nw4gH7KYWY6ptOkmFGQZoLuxzQvbjwf8uPwo8BoU5Rg4d/UxRB/3ElqbkmWvoFVyq8+Pm+MGE/iJ9byKDZje8Ojk5Vb6ieS9fIV40xdcaGV0y0jRZb1eXL7eI1OzFkZOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-656b7cf5c66so4380842eaf.2
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 17:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766280276; x=1766885076;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlaivU6khbq+H4gGSGhiP4ZojYz6+EckF6yCmLt2N4M=;
        b=PD/2NpWLT+6p9bW0/NudPUhLSAZBdSsgT75SAoN0ptLyhHgjSMtgOHXCk/1PlpM5zX
         GaMkUas0bWZi0Z7akMZbu3JCKIz3X9RLsB8n5KS82K8Rq5CWWlIxXYQRkRKlPjvERUlc
         IcMXDrjlNvpCBc47WGI+f8X5wP6AJc+HpwiYi6TW1P8bpcUEKlvUMysfSN/VppOAPfQq
         Tsw3FqxYrdKTSnBU62a/jAvK1qFhfb7fA7/MgDyqNWd8vdJbVcGptST8Hq3x5bHumwJT
         KahF9fXveZw5cZ7oQmBgCQKZLCD+TEX4aaptb2gbdPc/2mY9vEq7e7fxvPvt4sw4LF5c
         OiZA==
X-Forwarded-Encrypted: i=1; AJvYcCWAtyiP0Qj+ftY/4npczWBiwnUR9xKYReCEVaS6Wm5SaqLOF/Xd08n5nPOL0ksMkdvnOSCfB1tz/R6b4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/eFnP8olxljlFFe3oIW+FaUFdKLtYrHbnoKLrhcoml7KfRYQ
	KIzbgiBoWw6NAAFwxZ1BorgsmyM3NIrtRqQlJq/7YUGeWURRhv/K94HhC2RE2ktC2kiMor5JAYh
	ohLRmG9Q39IyLHLbZU5XUqy3kAodA5RTLLwJFcqkwXa4HTyuikewQeiNtbWo=
X-Google-Smtp-Source: AGHT+IH+3U0qxpXqSt2znP5azbSRtxeGiVcScp7xuFDXGkI7KaBiwhRhA56N66pgM47IIb6IgFNwUuSwgjmLVQsyft8Gz5mZYCuO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2223:b0:659:9a49:8f2d with SMTP id
 006d021491bc7-65d0eae1f9fmr3113949eaf.62.1766280276329; Sat, 20 Dec 2025
 17:24:36 -0800 (PST)
Date: Sat, 20 Dec 2025 17:24:36 -0800
In-Reply-To: <20251220192210.399423-1-szymonwilczek@gmx.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69474c54.a70a0220.25eec0.006a.GAE@google.com>
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
> -- 
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller-bugs/20251220192210.399423-1-szymonwilczek%40gmx.com.

I see the command but can't find the corresponding bug.
The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
but the HASH does not correspond to any known bug.
Please double check the address.


