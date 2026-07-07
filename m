Return-Path: <linux-media+bounces-66904-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AmCoECpkTWofzQEAu9opvQ
	(envelope-from <linux-media+bounces-66904-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 22:40:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8854571F9B6
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 22:40:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=dNohO7ct;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66904-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66904-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 030B5303DD1D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 20:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD60C3F65E7;
	Tue,  7 Jul 2026 20:36:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFEE3E5EC5
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 20:36:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456594; cv=pass; b=lBaCGxPkvFu9+uwPOuy55lP2NVdkWjVPahxFguTU6cyjxti3PA86tnT9QhVkSHKwBc93mB49N8nODT7Cxwr6ZCDm9dIyxF3c46IqvInpeOxI45Dg10boq+M33e2TSGIDhJuL3XQHhP/UutQnECCajMzV22ngO1dQRFj2Xs5wqlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456594; c=relaxed/simple;
	bh=HJ8OXuS5hgTr2XHk/8DDuJJA0eA/2PHZVltL570lzqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4kFhx/erxVf1LVqST40tVrpU8tjFx/bRzRSUkZA9N5XSDRarXcJ+viNLU6cbahwrCYhTWLRpPwI9LDbVjYYlV8Dkbw/io2SOqgvGF1m1VifBxybonmjppB9slyYZKdTfS/kTgVVt+sMwY9Wy0k+g79DingHuiHFzhDNjucOpIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dNohO7ct; arc=pass smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cab97c86bdso4015ad.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 13:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783456592; cv=none;
        d=google.com; s=arc-20260327;
        b=ENz32G54GRuyI2dRQMra2JI/TpHr8YBZlx3ZP1XWDJOaeGOzDUG30aiEOgdiE7NwzE
         oIYELFpodTGiXiPsKjWrP5sv7pxgmJgYM4z73dXsg1Jp1vsRfeY/DhbPU1lnolGx6IyV
         gPS/ldW6Oz6bAsv+Wil93T2JZOnq2XLGTn9tO7vX6fOFjQj8j7IwpgTkjoQYAzRARk/O
         RTD2iQWDoOmh+c4fOuvdDjSxfqgcmKlyD+/UOqGeUA7eUrqSZOHAVPMb4AxKte2sME0S
         YompjhdebAX9/9YF01GSR+x5//otrO/E+uCkHYGvg1oRF6iPdQZTJXRj/ybF0zMBjDJ8
         UeNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jS1etq2XBh0Y21n7kpErG7DuCVj3yAQ6JGZ2x5w3TvE=;
        fh=tt6K5Iv5H9S5vOyuDcWZJojHAzJV/upsIZE0sk166II=;
        b=fXgbaw9YlrWZEeACKWAR75eg2X2GjBpfFTDgNl1M3LH+cOVLinP+YziMLSxxU6qg9T
         totQuvdZFa7FYky3y4BCOAo7U4utXMd25/WQIE6YKpGxb/kid7TgTiqIrjvyyWxPKwlB
         xylUgo9aeyh77Ftbp/d8qxmBe8boQSh/gasLtH3HRq693smUBz9CoZ3Jj5oa58pa8OtE
         +UqjEcuHtVTQzhmxWgvXzHkJAYW5Ti+1YAiwOFfq5qZzdKZgUdhK69voB8h4iwPzmQ8h
         LDzVp5HCXkpJoj0KJkwbWVYEX1HqkRCfoJMqVUqxSn5R5EmJ2XATKUTEl8DOvKjw050N
         tt1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783456592; x=1784061392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jS1etq2XBh0Y21n7kpErG7DuCVj3yAQ6JGZ2x5w3TvE=;
        b=dNohO7ctFiQDh8hfgA3fieXFh4ooHz/+zEOTDjPG+mn2hxzilaFHbdQ5O5eZkbRB6o
         jddEOOY6vJ44jotyRwzmDY9mwHrqSUNVbHu4Yfb6Z5HWsZYNl9uVqol+THbVfPi5NAn7
         HM3QvSs3klg9fknuqJRDnXM8sOGnCVY+rDNiO52AM/bv87W7aMBWKZY99Ovw+kpkS+nT
         XIyakJYmO3i28r50cWFGfHDzAyoGbw7uTQh9Oyrbv04LRCu0RiC3qPqhm9m3F98RfK1c
         RoBOSiiQdppsvIetJCIaCaznVFrIzuV6w5DRJ/+EGttI6Lb5t4+aFxOzgRHD3LRND1FO
         XbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456592; x=1784061392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS1etq2XBh0Y21n7kpErG7DuCVj3yAQ6JGZ2x5w3TvE=;
        b=fBbdrhQmiR0CCVcoBURU4NMR/MZkwwNihbIpmnEmxvVmh43Wz3XZScOKooxDqJk6oT
         Hmga7ZhCUbjprzmsvOj4Bz10isoKshLcLVFaowOnbvfo1FIUScwXL9Jg2fm4nwCllw6j
         0c7V7rB9saz/dCH67lmc+g0S6GMxO1Q7wjrxAcWihbLEjRsP5XfGjXoFIMVdq3FWvQH3
         dJXhNeEyAza5i6CDyaWzIIdEscBtwxX56tbhQpBuF+a1YCgvJIGJm4PexQS8uum6Wchv
         5kWrIR8Fw1b16XDNrMGaRd8WyDe2e9nTajiD1ixc2O8IATHqUmcuQwZHI8/at6X/Yjk5
         7L1w==
X-Forwarded-Encrypted: i=1; AHgh+RrAmJz1GgLbURd0ru+sJw1obN6UiFgPIdjZ3mG5sKcadE0K5OYhOi5f8f+S8rgbyP58FF8XPvf+VTcTIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9eGUwvcABn1OZlyRnmsdzy+g2U0lDhUM3LAmTDcMKsscoxdmX
	MIeJdR0gx+4upnltoIGpJTzL2XPBSFEbCSy6aheZ/IZElZqd/EMGYvJ3P+wyQ8oE/f0cZEVECrs
	dTWRerASpJJvoZLKbjBorPNpTUVmB+1EqEYc6R62T
X-Gm-Gg: AfdE7ckV66JNXloFGzrBeOwqqIz/PeTmOVh7txjgLWN5jJQTI7ZQJzgk54jOgm3CDvz
	MBjqNXPW4EX6zqCt5FvVYnPCt0cyliMS7lx2zPcPZ08j4E/stWYfqoSUZM0D/djqwEY4ArVNJJ7
	7sKhOuyjjIs8bg+bsJhcjb77E/Cszn6ySXmx9Tcz4fBuPjlbNw4+LcR3gRX596d5TN4y86hMwqL
	8usbLLjrgw9FDAMhnCSzpC0UfbbTVDzQi5rjvsQeCmRL8Irhg15TKCA4xVdjBmaI1jKt0IJ0EPY
	s8wHFgdxlORihkoopIoYQsmDPcHrzZrXpVgc1Q==
X-Received: by 2002:a17:903:1746:b0:2ca:e513:17a6 with SMTP id
 d9443c01a7336-2cce6070055mr514845ad.15.1783456591431; Tue, 07 Jul 2026
 13:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com> <20260701-tcpdm-large-niovs-v4-1-ca4654f37570@meta.com>
In-Reply-To: <20260701-tcpdm-large-niovs-v4-1-ca4654f37570@meta.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 Jul 2026 13:36:18 -0700
X-Gm-Features: AVVi8Cft8xhwKuUJQBVnGzgYj4CRKQzZAZeZD_sYSlOKVL1n3UGciPvnN9lcbO0
Message-ID: <CAHS8izNdJ1LTOr_pLjXef6Yv-=JOFPe1GcZtcbStD93Tkpy1XQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per dmabuf binding
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
	sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk, 
	Joe Damato <joe@dama.to>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bobbyeshleman@gmail.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:joe@dama.to,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66904-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[almasrymina@google.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[almasrymina@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,dama.to,meta.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8854571F9B6

On Wed, Jul 1, 2026 at 12:22=E2=80=AFPM Bobby Eshleman <bobbyeshleman@gmail=
.com> wrote:
>
> From: Bobby Eshleman <bobbyeshleman@meta.com>
>
> Every devmem dmabuf binding today hands the page_pool PAGE_SIZE niovs.
> This caps a single RX descriptor at PAGE_SIZE, burning CPU on buffer
> churn for large flows.
>
> Add a bind-time netlink attribute, NETDEV_A_DMABUF_RX_BUF_SIZE, that
> lets userspace request a larger niov size. The value must be a power of
> two >=3D PAGE_SIZE.
>
> Measurements
> ------------
> Setup: kperf in devmem RX/TX cuda mode, 4 flows, 64 MB messages, 60s,
> dctcp, num-rx-queues=3D4, dmabuf-rx/tx-size-mb=3D2048, 10 runs per niov
> size, mlx5.
>
> CPU Util:
>
>    niov        net sirq %        net idle %         app sys %        app =
idle %
>   -----  ----------------  ----------------  ----------------  ----------=
------
>      4K   62.38 +/-  8.27   33.40 +/-  7.51   54.15 +/- 10.23   43.67 +/-=
 10.53
>     16K   58.91 +/-  5.35   35.23 +/-  5.88   41.05 +/-  8.87   56.42 +/-=
  9.24
>     32K   64.12 +/-  0.68   31.09 +/-  1.48   44.54 +/-  3.51   52.63 +/-=
  3.65
>     64K   54.69 +/-  5.54   39.67 +/-  5.81   35.47 +/-  3.11   61.97 +/-=
  3.27
>
> RX app sys % drops ~19% from 4K to 64K.
>
> Throughput:
>
>    niov       RX dev Gbps   RX flow avg Gbps
>   -----  ----------------  -----------------
>      4K  300.63 +/- 53.21    75.16 +/- 13.30
>     16K  321.35 +/- 28.20    80.34 +/-  7.05
>     32K  347.63 +/-  2.20    86.91 +/-  0.55
>     64K  332.11 +/- 14.26    83.03 +/-  3.56
>
> Throughput seems to increase, but the stdev is pretty wide so could just
> be noise.
>
> kperf support (not yet merged):
> https://github.com/facebookexperimental/kperf/commit/8837577f920876bce698=
6ec18869ac04439ebcd2
>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>

I'm pretty happy to see most of this patch being a spot-for-spot
replacement of PAGE_SIZE with a variable. FWIW:

Reviewed-by: Mina Almasry <almasrymina@google.com>

> ---
>  Documentation/netlink/specs/netdev.yaml |  8 +++++
>  include/uapi/linux/netdev.h             |  1 +
>  net/core/devmem.c                       | 55 +++++++++++++++++++--------=
------
>  net/core/devmem.h                       | 13 +++++---
>  net/core/netdev-genl-gen.c              |  5 +--
>  net/core/netdev-genl.c                  | 19 ++++++++++--
>  tools/include/uapi/linux/netdev.h       |  1 +
>  7 files changed, 71 insertions(+), 31 deletions(-)
>
> diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netl=
ink/specs/netdev.yaml
> index 5f143da7458c..70b902008bd3 100644
> --- a/Documentation/netlink/specs/netdev.yaml
> +++ b/Documentation/netlink/specs/netdev.yaml
> @@ -598,6 +598,13 @@ attribute-sets:
>          type: u32
>          checks:
>            min: 1
> +      -
> +        name: rx-buf-size
> +        doc: |
> +          Size in bytes of each RX buffer the NIC writes into from the b=
ound
> +          dmabuf. Must be a power of two and >=3D PAGE_SIZE; defaults to
> +          PAGE_SIZE.
> +        type: u32
>
>  operations:
>    list:
> @@ -812,6 +819,7 @@ operations:
>              - ifindex
>              - fd
>              - queues
> +            - rx-buf-size
>          reply:
>            attributes:
>              - id
> diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
> index 2f3ab75e8cc0..85e1d20c6268 100644
> --- a/include/uapi/linux/netdev.h
> +++ b/include/uapi/linux/netdev.h
> @@ -219,6 +219,7 @@ enum {
>         NETDEV_A_DMABUF_QUEUES,
>         NETDEV_A_DMABUF_FD,
>         NETDEV_A_DMABUF_ID,
> +       NETDEV_A_DMABUF_RX_BUF_SIZE,
>
>         __NETDEV_A_DMABUF_MAX,
>         NETDEV_A_DMABUF_MAX =3D (__NETDEV_A_DMABUF_MAX - 1)
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 957d6b96216b..3d6cf35e50f3 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -46,7 +46,7 @@ static dma_addr_t net_devmem_get_dma_addr(const struct =
net_iov *niov)
>
>         owner =3D net_devmem_iov_to_chunk_owner(niov);
>         return owner->base_dma_addr +
> -              ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
> +              ((dma_addr_t)net_iov_idx(niov) << owner->binding->niov_shi=
ft);
>  }
>
>  static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
> @@ -90,16 +90,17 @@ net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_bind=
ing *binding)
>         struct dmabuf_genpool_chunk_owner *owner;
>         unsigned long dma_addr;
>         struct net_iov *niov;
> -       ssize_t offset;
> -       ssize_t index;
> +       size_t offset;
> +       size_t index;
>

nit: I would keep this signed. Some of the most frustrating issues I
ran into is some of the underflowing and then passing a > check or
something. Although if the LLM is not complaining about this
particular case, there is probably no issue with it. I also notice a
lot of existing code that deals with indexes and offsets goes for
signed.

--=20
Thanks,
Mina

