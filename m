Return-Path: <linux-media+bounces-11756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B58A28CCC02
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 08:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6DF21C21234
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 06:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52AB13B597;
	Thu, 23 May 2024 06:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="Uz2AHfik"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDC213B2BF
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 06:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716444179; cv=none; b=m2M7Gh9WN8Jd4sOJGlQoqh4upTk6fN3crbmzrmS5mfvnO/Pz6RZ08SsjweN7XSToDejZBdYgpNfu5/JOCfQhfkv3tviCOuINzH+77rteZQqyr2Wo/IvLVf6iAZ16wql2R6nMrTKDB2/58sze+xQokqxPQbpw/d+w8zezDtIAAn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716444179; c=relaxed/simple;
	bh=B9lGrOwbzZ9cwWP1ohGSBcMGMvcXioUh06F1RRqtc5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jM0HTGJFuHxLDILqG6vxnYpLrWKxizAHXINGJr06vMZAONVcUOV8F75egbUz1212nCG9tzBMvf+K+lLsCRmL4JvCHAvaJ58nATnjdTKXMNbiGSi/92Voht2KcqyZH0O0WuzEJflwsKVC1m2nb70QaE9njkm04FQ9DgJZ4vV0g7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=Uz2AHfik; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-36e9661e0feso18033875ab.3
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 23:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1716444176; x=1717048976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txOSv1K2CA1USg0Ze10vD1qMyJxbEs9Mfk9GiCoI090=;
        b=Uz2AHfikahhuUowwWHZ/rUV3mnPgvxCUBUVLy75Ni4QVr3Zm8DMJc7X+YPT/ZlueFf
         fM09t2fSBt5pPpQRo2M2zZC0pkRmdXI9FCcScF4/EKN/cySBOR/qDzA5ekE4ILkpPwpy
         5mKNJ6bHDg+TEheZbQ3IkCrHP/NZCEn3hQOxoKAsaSNFqq1PjKOo0dSQD72z4WdrL11T
         SDuOkvOaGOZFmfxRTdXg/vfbkBY5oBXpiOFGPI2dN03MwRCRVp7zTktF7l5JeFQL9kbh
         gj4aNjvikrd9qQBAiO+5XOkySFNkgVh2QVR/GkOax5g1Q2KM/PsKBO5u3BVjXDevfa5r
         Zpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716444176; x=1717048976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txOSv1K2CA1USg0Ze10vD1qMyJxbEs9Mfk9GiCoI090=;
        b=nLHB5FHp1Su+TqeWixhZKswviVAyfGgvgoswTGLaD0HefFrlmh0iu3PxUX1rU58SjO
         jnt0Zi4m6SGA+LX6riyzZNc5fC7+vCHnoNsgX/a4h++JnlBrcVj5l7zTbm8imd7oEKS4
         K2LTTHzaHEiZ0yS0liV/yDpt4iC+3BqsBlCnCOUMuK5V4f+AVVEVCxbt+WHVa6szzxnt
         Kx3NHi0VacHGTAiUF3YZRJVj5QZW8qHDfUhaskRl/YnWdZ92CJyEsAZcTmELCaNh46Vk
         Nr7dA331fNALJirnzz7bC9gcgPjNiTHcYVi2AGwa/93E5A1sKcJh10eThiz/3mjWOJLW
         EjXw==
X-Forwarded-Encrypted: i=1; AJvYcCVkJLCw3TN5IkrN1JJO0AnQ0qWUmbhAdPNtwZOrbvginrSr4xVhA4MBc5Tlqo8/UyW9P84fmNVWQBBmn7nZSQ4aG1b8VpdJ41aNMzY=
X-Gm-Message-State: AOJu0YyYGOjVjjMuB9Ij5cLgl9r9Ce2TV54Mwq8Ty0WkiJ7ka8bgvzZc
	SAFnZLpoZGtxqZQdqz7RIs+1Pf4N3J2CDhAdfGGMRXwtdNoW3F0PV/v+ZRIc42o=
X-Google-Smtp-Source: AGHT+IEHlOqXvdbfYiugVF0TXgIiftVk0fEr87owHTsVUKSpnXRyU8iozPM5JlvqTh0LUpuxvOHGhg==
X-Received: by 2002:a05:6e02:1447:b0:36c:7f3d:59a with SMTP id e9e14a558f8ab-371f7c80fe6mr48056835ab.4.1716444176327;
        Wed, 22 May 2024 23:02:56 -0700 (PDT)
Received: from [192.168.1.16] (174-21-188-197.tukw.qwest.net. [174.21.188.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-634117190absm23448503a12.87.2024.05.22.23.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 23:02:55 -0700 (PDT)
Message-ID: <9097e78d-0e7d-43bd-bafd-e53a4872a4d1@davidwei.uk>
Date: Wed, 22 May 2024 23:02:54 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 11/14] tcp: RX path for devmem TCP
Content-Language: en-GB
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240510232128.1105145-1-almasrymina@google.com>
 <20240510232128.1105145-12-almasrymina@google.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240510232128.1105145-12-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-05-10 16:21, Mina Almasry wrote:
> +/* On error, returns the -errno. On success, returns number of bytes sent to the
> + * user. May not consume all of @remaining_len.
> + */
> +static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
> +			      unsigned int offset, struct msghdr *msg,
> +			      int remaining_len)
> +{
> +	struct dmabuf_cmsg dmabuf_cmsg = { 0 };
> +	struct tcp_xa_pool tcp_xa_pool;
> +	unsigned int start;
> +	int i, copy, n;
> +	int sent = 0;
> +	int err = 0;
> +
> +	tcp_xa_pool.max = 0;
> +	tcp_xa_pool.idx = 0;
> +	do {
> +		start = skb_headlen(skb);
> +
> +		if (skb_frags_readable(skb)) {
> +			err = -ENODEV;
> +			goto out;
> +		}
> +
> +		/* Copy header. */
> +		copy = start - offset;
> +		if (copy > 0) {
> +			copy = min(copy, remaining_len);
> +
> +			n = copy_to_iter(skb->data + offset, copy,
> +					 &msg->msg_iter);
> +			if (n != copy) {
> +				err = -EFAULT;
> +				goto out;
> +			}
> +
> +			offset += copy;
> +			remaining_len -= copy;
> +
> +			/* First a dmabuf_cmsg for # bytes copied to user
> +			 * buffer.
> +			 */
> +			memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
> +			dmabuf_cmsg.frag_size = copy;
> +			err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEAR,
> +				       sizeof(dmabuf_cmsg), &dmabuf_cmsg);
> +			if (err || msg->msg_flags & MSG_CTRUNC) {
> +				msg->msg_flags &= ~MSG_CTRUNC;
> +				if (!err)
> +					err = -ETOOSMALL;
> +				goto out;
> +			}
> +
> +			sent += copy;
> +
> +			if (remaining_len == 0)
> +				goto out;
> +		}
> +
> +		/* after that, send information of dmabuf pages through a
> +		 * sequence of cmsg
> +		 */
> +		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
> +			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
> +			struct net_iov *niov;
> +			u64 frag_offset;
> +			int end;
> +
> +			/* !skb_frags_readable() should indicate that ALL the
> +			 * frags in this skb are dmabuf net_iovs. We're checking
> +			 * for that flag above, but also check individual frags
> +			 * here. If the tcp stack is not setting
> +			 * skb_frags_readable() correctly, we still don't want
> +			 * to crash here.
> +			 */
> +			if (!skb_frag_net_iov(frag)) {
> +				net_err_ratelimited("Found non-dmabuf skb with net_iov");
> +				err = -ENODEV;
> +				goto out;
> +			}
> +
> +			niov = skb_frag_net_iov(frag);

Sorry if we've already discussed this.

We have this additional hunk:

+ if (niov->pp->mp_ops != &dmabuf_devmem_ops) {
+ 	err = -ENODEV;
+ 	goto out;
+ }

In case one of our skbs end up here, skb_frag_is_net_iov() and
!skb_frags_readable(). Does this even matter? And if so then is there a
better way to distinguish between our two types of net_iovs?

