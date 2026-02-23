Return-Path: <linux-media+bounces-53174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCzRI6IfnGkZ/wMAu9opvQ
	(envelope-from <linux-media+bounces-53174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:36:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D7A17400C
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74E693053DDC
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1F534E76E;
	Mon, 23 Feb 2026 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XpcPzTpr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DD634F24D
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839290; cv=pass; b=DSt3WmBYRBHgUzptQIK6WtYpYGtLwpMIBiMprSXYHMV2R+oJFQFtwxKpuoVx+PPibRH6Boia5xESLb2CscSWXC2dO0xOngjNqgLhhuuJEEf9sRe2sNECrH3MHijNIDVFX8i0Omz6vo6qmPGl1Md0inP53KRXjjg41hXuuAsye8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839290; c=relaxed/simple;
	bh=GbqV5AAIMTMr3a+qqWx1ZKvGqjhfSI3yGH9Cw30vtVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRTzyXm662CDn8qALSu/YJB4aGa7pwkiPX5VH6r8t/ZauNpTr7dOWlN6/+xrRSs1ypk4jeeTGlNuuAYlLi6BdfcN82lTVBAmg67fACrZ5GCwZrGqb9O0Ok9Exv1ZXD0sQ7HCF9bwR+Puv7J80UvJvUwdk4zmkgLDqc+4J/oa7Is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XpcPzTpr; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e5eaa491cso5431082e87.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:34:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771839287; cv=none;
        d=google.com; s=arc-20240605;
        b=Fqw2vfvxSz6LINklHbrQZbyljsZxvklbkayrVemGuQaUUM8nXTqidNGiMpTvlFdyUY
         zYpZpfBfuVCIPuaMf0M9PPFCpcYL6MAUV4Fb1lOQLVZD0B9DB+QvH37e+R/M45LdLLA1
         bQNR8LRIIrv1oHGrmC7czm72Klgj3hLON7hqtXTULRVIt4UPdW0OIiNMDpndPItkiAD0
         OLw/PGgoqRtbzSF+T1mWvIkhRK9sswmFYzbX/Bu3z9EXpdWtkgJfqYvQWlCEvAIEzexM
         CCQjmtgSt/vuWu5abvJMt6t4sySIzMXaZPnQpyi6xjXFld9tP1m3nZslmVsLQ/xi9SMv
         QV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CC0RsHc5rv/DbZ2XdKX1LEqIVhdxbzfKb7OeoBIBqbk=;
        fh=77gG7YYPF7DPVFH5r6wX8FCt0AEL5loYNT7Lm9DmMvs=;
        b=FH+SD2GKLKmscQHbmPZwZGEFCezA4ViNo7/C3jDk4qTlTfBW9m2sn599m8ep70NpRf
         RPuriZkP9FFNnriOmagoRLxT7OhUJcsTPEhWnQWzwiJ2ihfC3u/uNlQK4+5rcKfl8lC9
         ZSlILkKM9wo2/dCmu8lAtUmsskYj8zysgsxwWIPUTpXPLRp7mmZFdu6nYKuVg4mME6ZR
         CAkM9vsGc4okF1EEtnY6ShEq2071BVO+ABg/X+nf8JNjTiUvo/KV4UJz5gfTk/m637dV
         zBS5N4WV5gK5Sv+YFCDik7SiSWJwOUon0KuLQEwhhCu3rYgHEMAkX4jN+UMRsi3ioF8r
         mR6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771839287; x=1772444087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC0RsHc5rv/DbZ2XdKX1LEqIVhdxbzfKb7OeoBIBqbk=;
        b=XpcPzTprrixG1JuS6gT+TDq01sTLB7RGhSbbHBkuzlZ/qJCu3lMhN1x6gYtX63JM1E
         H81o54UZ2wvk+0WG2MfHXs3sLCMrzrztsqd4R1zA00JtS3ppFWL5FSC8TnLmvAWX9Lwu
         xr7d1EPyQWqZgp7/y1GovrvKfAC7/kYAM32RPlqmQaU7n0M0bZ0Q7cyhOcnSNHLId28s
         60nFGCjdLvyly21MCaFea6TLMxb8CyfFpyu9jZ5DcHGpSkl5ZxfGqoq72p+AKM060ZEs
         a+kFzi1xDCeBgSRL/R7qdVbVHq4DNREu0fX7QNIyoCcPFeEpphenO3v7UdGb2QfRxYNi
         qy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839287; x=1772444087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CC0RsHc5rv/DbZ2XdKX1LEqIVhdxbzfKb7OeoBIBqbk=;
        b=kcHIJQo+UHuUZAyNDcSq68XIML3KWqdt832Q9QB4dH0VzH72Hc/cXNVDPt50G/okR5
         QH7bbxiw4XOdvSbYyAjNymcztHe1BVshb1v1YNZFBgpLvuy+ZkVHEceCTwWZiKSdxkab
         y4C56TGl7KpQaO+xTxxZ3ezODwVc2lsPqmlkWeWmEDBSWITr4TwO/PBYBDZnGQDwY4W4
         BH3LkEyagOe3v/NW2Gf8WnqZPMZGfD8qpnDxcyz4hlZ5jVxdRyu+J4Bi1hVS95LId+Ka
         RoekBn9Vvkk3ki/O2tg5zyspk39/qy/GCNvjTumCty80aGePAw9fN9LTCfRO4JB39spO
         C5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXpuhu/15wU/zxWOUoxzdHgr8ZSHQZ0e4W6V11uIvNWTshp2XKu0eMVidD8Nife+oBqiczXZqu58W8vHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJbkKRp3k2vdoH0LcWIGnIy7i82w5yRuIz06bUjmB8qlwTW3c4
	IOwY6KCdjKC2p0q//yz0FrQ2hkeEtBp749Xe9ETlmuvkd+L91U2o6131GwMWGawUGeg5qlyXHtJ
	4svYryroqiBhgWQmZk7TvTjIgl/J0kKMShwaMg7Nqew==
X-Gm-Gg: AZuq6aIsVRnydujESPWbRbYWN7l42eA6e2RZdlgtFGXm98eBRO70vALH7SIqij2ZtAz
	bzqyqNvYYsgq+xMrgRdE3/bybCMHqReCoJbYX9ygJ/HSSsI1VAceGohlgvExkoc8HgEQSKz2VdY
	62U5Dh7CRgYCwJ6KPTTfrepb2+Wp1Am455IXTZkEQQIWXywWWBjI+x6hBFk9aLXpgQK9vhYZ+Nu
	twdVghyp1dUX87QGFquLQg0u+B4afwSLJXdfesgIwBxpJQPFaNTvdgk3w2u4bQ7e3+IKZ4kVbG7
	Lig6d5jmOtaSAJtnEJCf8yb5ACWU0kRnj9LkHu1w
X-Received: by 2002:a05:6512:104b:b0:59e:5b94:18a6 with SMTP id
 2adb3069b0e04-5a0ed87d6d6mr2202947e87.1.1771839287310; Mon, 23 Feb 2026
 01:34:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113141248.203944-1-marco.crivellari@suse.com>
In-Reply-To: <20260113141248.203944-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 23 Feb 2026 10:34:36 +0100
X-Gm-Features: AaiRm51Tp8AeYS-VzWnO9OS96WU4OUevrXkmGzPH0hPv5rJT4caUA4kOUjZS-Dw
Message-ID: <CAAofZF5DneecC=Ni+Qq2iMbsewHBTVpFga+f3VT+tmzjmoqEkQ@mail.gmail.com>
Subject: Re: [PATCH] octeontx2-af: add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Sunil Goutham <sgoutham@marvell.com>, 
	Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
	Jerin Jacob <jerinj@marvell.com>, hariprasad <hkelam@marvell.com>, 
	Subbaraya Sundeep <sbhatta@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53174-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,marvell.com,lunn.ch,davemloft.net,google.com,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E2D7A17400C
X-Rspamd-Action: no action

On Tue, Jan 13, 2026 at 3:13=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>  drivers/net/ethernet/marvell/octeontx2/af/rvu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

