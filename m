Return-Path: <linux-media+bounces-64932-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uANYJYN1MGrxTAUAu9opvQ
	(envelope-from <linux-media+bounces-64932-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 23:58:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E203668A3FC
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 23:58:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dzy+gkH2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64932-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64932-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E603730D0A4E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 21:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E013B71B0;
	Mon, 15 Jun 2026 21:58:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74011319852;
	Mon, 15 Jun 2026 21:57:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781560680; cv=none; b=egBj2TAc+gr+ZXeT/MZfL8O/4i7HbfxOetuY76c+4xsMeAi2ofklZm6bj3JjsU6uo6edsd438vjsiW2g9T+J1LcLtDlv9jv2qkiBWQdvgswMobuZ0euWSNYoIdTokRdwMp7mT1ugZFwtI6+AgrA4lSUJuV2186Y/D/qavMKd3t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781560680; c=relaxed/simple;
	bh=9kivlZtZbuO0VOVybcXe6QAws9Mmpg58aOrzAFKx2q4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bRlqGfvVw8j+NiL6HVx9REwOnke52BElw9+mehh+Nn7Ifx+3yPNLW7tVGAj59UZpw1ePfmoctPZX2FCYnvoBewEWJ8L0phuGETwZZU28o5L1F7KZQO/3gMaYFhHR36DYxKeCZwkV5HyTvywl4LuYJ88o2sQdgH3n8K1GEX3lj4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzy+gkH2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16521F000E9;
	Mon, 15 Jun 2026 21:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781560679;
	bh=ZybuVlKws8hgVhXg4VsJD/g+orod/d6HM3+PwcKNxVk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dzy+gkH2/qCX8JT+F7lkPuVsTM3L6UsLZ8D86wt4w/t6ROOeQ11iGwlemG01ax3k7
	 I3lQv0qdtOM1xOIsd0YpO4wl5CvwzYMNHZSErzo2fTighoGj5SutfOdQTlr56nMSQ6
	 K+dfaC1nJCANxJPr33HAAvJ5VnWXGtjXlvRLS1iQNDran5OiR1w0NBBg8EfQCAckBt
	 rbMdrrfKi6CkZO6yfDSmwrWLnPmUTQ2m8VUg4Tq6aajwW45eYznRqiZ7gIK68YKq8j
	 CTusxYMFdNGCTFdoRamtFeGmiXeZb+n3ZrL3WA535cracAT9NMx4hhvzlCuRLPgGkq
	 ej+6PFkFapxTw==
Date: Mon, 15 Jun 2026 14:57:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 2/4] udmabuf: emit one sg entry per pinned
 folio
Message-ID: <20260615145757.0b2ddcf3@kernel.org>
In-Reply-To: <20260612-tcpdm-large-niovs-v3-2-a3b693e76fcb@meta.com>
References: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
	<20260612-tcpdm-large-niovs-v3-2-a3b693e76fcb@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64932-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bobbyeshleman@gmail.com,m:donald.hunter@gmail.com,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,redhat.com,kernel.org,lunn.ch,intel.com,linaro.org,amd.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E203668A3FC

On Fri, 12 Jun 2026 09:25:58 -0700 Bobby Eshleman wrote:
> dma_map_sgtable() does not always merge contiguous pages for us, so we
> do this internally before exporting.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---
>  drivers/dma-buf/udmabuf.c 

This will need at the very least an ack from DMABUF maintainers,
so it's a bit late to consider it for 7.2
-- 
pw-bot: defer

