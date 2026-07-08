Return-Path: <linux-media+bounces-67069-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S8ZPHeC1TmpJSwIAu9opvQ
	(envelope-from <linux-media+bounces-67069-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 22:41:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F1872A472
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 22:41:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ip9XoIOX;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67069-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67069-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F7C131383CC
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 20:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CFC31CA4E;
	Wed,  8 Jul 2026 20:35:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD96E3E4C68
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 20:35:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783542955; cv=none; b=GBuF3LqaCCOb1rvYOCoDmLg1f24IahhHUOtf6eXfqg+fzaqrO+wnDh7N2MYWZveOBtykjMzzVH7yGIWRx04LvIdJhHXAIEaYauYTjR4IMPemP/118Hr49rNly3uoSd15z0X0t2bsRPpVwVUDlFD8tX798Kg7XDKwCteH9qQfEvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783542955; c=relaxed/simple;
	bh=3I3mp7KJKi0CVH2nIGOLczzk5TWZIUatXfsGuzb8OvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWYoG0bnNJmHUFdNaSvXCcbX4PfTRWFFJtWDmA1VP18bEk5lkbmVx14uRia2LhDCeJnpRuBcb1rJd2yDI+244efY/aY+x8nhLPVHG6rreXh3C3Fevfy3NfeObNpMKXv4ue9cBIQYJrgYOhKgg5S56+vsgzv+qg1EAE7KLgJiyG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip9XoIOX; arc=none smtp.client-ip=209.85.160.50
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-448df16ab34so74582fac.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 13:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783542952; x=1784147752; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=24xTmwwfHf8GGJ8ej4fMcb3MXrY9M9ELYMVJ6Iyw0KE=;
        b=ip9XoIOXuDEuy1U/8yUG9fQeLr/aaQuWlysRfx7lToefvfkhYNJivSwd1xNSjjl7hL
         clKp27SMWNTJuJijxX3seC5f5CETXySWxhrbnU7I+B08k5y2pJFSb9O2t4JpDHi2FXys
         M73WP5sC1BZigPbqC+7n+l++QsA54baGpliS1fJCymlKxIbsABlzNB/upmQKSMVbOQ7Z
         d0xdq247GSoaPXl3IRFZAsPej6qXUU4XMA7KWlE7LHlMT/PO2pLUtvv+daJOAns6HKZM
         852GFl9wavYTn/WJKiiIiBveGigDrHXL1Gn/S5Nv5K31K7O7cgVkcg50PH4LPLVzk0d+
         108g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783542952; x=1784147752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=24xTmwwfHf8GGJ8ej4fMcb3MXrY9M9ELYMVJ6Iyw0KE=;
        b=Df1NZ+G0MfLlvNZ1c8TOR7vdFR1U2GRngnIjSFyTfV0fmG0JG0OwAn7VSwL1fN4jRs
         9kcA8UN8KfLH40tIzbM9abEtp8fhgbcbdc83JMv/Eqd6KVAiQxtPdfZAdJMAb0qipssQ
         v6yLkf9/fR+xzcBe2frCiho7cv/AZUqwLfkO4OGWtqIG8WPIAUeSqMYeoLXj794f2V0Q
         eD+M+HBdJDhJ09XxWEfLrZpNxwjlLg3DTXhSx1jq2yHhcmB8bOPPiYn0CWb9wqmP4HdC
         03zhlWX+ajnAnil6fiFSnApqX6P/8G8foKJNXdAhIzcgGTmjmfDt99Hb8XSq4VU4MbXd
         Ih/w==
X-Forwarded-Encrypted: i=1; AFNElJ9WtaIki3kr/CcaqurvzRPa9kTKZwf6UkGMqd5tBKaNSMRyN6TT60H5PwcKDBbTZAfjecFi5H1wQ4nXOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF9QVR72i840bT9+7pLtaQiNO5gR4MtXOpCpwfQyVrTPMgKrZR
	pllbX8UDgfgFl0vWyy6khO2VEe9fJnuRy0Gc3F7/sgWpe1F7rUwFa61U
X-Gm-Gg: AfdE7cniJceOd8+zxg+jARmzE4KA7G5buRoQn14j3K2lnqUBcWOX1n+AgpUGwswnunm
	Byk2gN5EdhxbibA63gKz0z9BB1/+fTR9DicsGdiavqWSZ2QnNUTHHqUVjF9ghHhCEotqjtGCCwz
	0SY0Xvap9JYUWQUFdnQbKpApMBZmLMeqkM+xAbh4ubxNCJ5pLSsnNlKGLP3ASYWhiKsx3LQ8f6Y
	y9dWXvGfe2v8ahb+Ioe9JNmnlUeI+TqjbRCP6siNvIaNHpys6cgU8uzdqK06l16pQrGLt5CfBHj
	llbCwoBkuwBiSPWoow40+H8QK3LB47vmdd+j/S/j7lj3u2hqcl4Lj9/ZncKaBDPd07u88GQVi7I
	6FMAMy/uxEzrnJ3IAMFyG7agu4kGRbk6M/R9Edu4L4R3qjKEtUQwuqGcakbD/Tx/Srw6wZ8rNLS
	T4g3PFkvAdk5FaXGZcFO9CapKSiE0nlTGD
X-Received: by 2002:a05:6808:6d8a:b0:486:4212:d728 with SMTP id 5614622812f47-4a206116affmr3560063b6e.43.1783542951653;
        Wed, 08 Jul 2026 13:35:51 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:a::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1afde6cffsm2535573b6e.11.2026.07.08.13.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 13:35:49 -0700 (PDT)
Date: Wed, 8 Jul 2026 13:35:44 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Mina Almasry <almasrymina@google.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, matttbe@kernel.org,
	skhawaja@google.com, dw@davidwei.uk, Joe Damato <joe@dama.to>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v4 1/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per dmabuf binding
Message-ID: <ak60menMXAbi/SCw@devvm29614.prn0.facebook.com>
References: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
 <20260701-tcpdm-large-niovs-v4-1-ca4654f37570@meta.com>
 <CAHS8izNdJ1LTOr_pLjXef6Yv-=JOFPe1GcZtcbStD93Tkpy1XQ@mail.gmail.com>
 <15e72c82-ca99-481b-bd53-744fabd503b0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15e72c82-ca99-481b-bd53-744fabd503b0@redhat.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67069-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pabeni@redhat.com,m:almasrymina@google.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:joe@dama.to,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[google.com,gmail.com,kernel.org,davemloft.net,lunn.ch,redhat.com,intel.com,linaro.org,amd.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,dama.to,meta.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devvm29614.prn0.facebook.com:mid,meta.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11F1872A472

On Wed, Jul 08, 2026 at 12:50:07PM +0200, Paolo Abeni wrote:
> On 7/7/26 10:36 PM, Mina Almasry wrote:
> > On Wed, Jul 1, 2026 at 12:22 PM Bobby Eshleman <bobbyeshleman@gmail.com> wrote:
> >>
> >> From: Bobby Eshleman <bobbyeshleman@meta.com>
> >>
> >> Every devmem dmabuf binding today hands the page_pool PAGE_SIZE niovs.
> >> This caps a single RX descriptor at PAGE_SIZE, burning CPU on buffer
> >> churn for large flows.
> >>
> >> Add a bind-time netlink attribute, NETDEV_A_DMABUF_RX_BUF_SIZE, that
> >> lets userspace request a larger niov size. The value must be a power of
> >> two >= PAGE_SIZE.
> >>
> >> Measurements
> >> ------------
> 
> Checkpatch complains about this separator usage:
> 
> ERROR: Invalid commit separator - some tools may have problems applying this
> #15:
> ------------
> 
> Please replace or remove it in the next revision
> 
> >> @@ -90,16 +90,17 @@ net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
> >>         struct dmabuf_genpool_chunk_owner *owner;
> >>         unsigned long dma_addr;
> >>         struct net_iov *niov;
> >> -       ssize_t offset;
> >> -       ssize_t index;
> >> +       size_t offset;
> >> +       size_t index;
> >>
> > 
> > nit: I would keep this signed. Some of the most frustrating issues I
> > ran into is some of the underflowing and then passing a > check or
> > something. Although if the LLM is not complaining about this
> > particular case, there is probably no issue with it. I also notice a
> > lot of existing code that deals with indexes and offsets goes for
> > signed.
> 
> At very least the above change should go in a separate patch, as is
> quite unrelated from the rest.
> 
> /P
> 

Sounds good, I'll drop the type change.

Thanks,
Bobby

