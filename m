Return-Path: <linux-media+bounces-62726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKKFJrF2FGokNgcAu9opvQ
	(envelope-from <linux-media+bounces-62726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 18:20:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBE35CCBF9
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 18:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3425B3021D23
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 16:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0B03F54C7;
	Mon, 25 May 2026 16:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dr4TZWgD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5E63F44EB
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 16:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779725968; cv=none; b=aicwSP+P0tp1/yELrWKHDlu+cGH1+5ZJoWb9UtEunrQP4/hDJR2xNteTe+RjZrJiq1QijApQDYwc4n1yqe+ladK9bH3HEV+lxFTpUcu9TbubUcmbmm3mwnGpzoogAsWWlnMlQUZVITRg/V8gqatO90s3DLI1fY2/VY87fVUiVEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779725968; c=relaxed/simple;
	bh=6ATTepTt/W1eTfJKlZcOEC7miXlLa4M2ScAL84EJqWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iUNsy4sOmePP4fvv3kalJoSZvnDJZsLVLn0RXY1K8zXLQQti/YjqjHqPXzr+T7BtpyMd2zuY0JFZhTcnqjdA6MX0QcGFDeFJO2RijcCBdkFKinxUYW+t+tfknHMktkKuxKmbRqAzYggfs1ipHZ5NCUn4c066KgUyZ27SAdbIf8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dr4TZWgD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so51631045e9.1
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 09:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779725963; x=1780330763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YA+/JJXQ9abERc/NViF0XyaL5qdJ2pUb4chRkVwshY=;
        b=dr4TZWgD1Esm3Qat2phkFsMogL1QSisy0KS5zRNj7QLd+O/GTWfZKF/uEdi+t9nmcR
         dNii4QQxToJf+zI9chidglTAOXLiVdJ387YJpWnu4O63RZWZpdft6OjU//0zfSVBO/Yy
         aLoJ+GdqYyIcf1QZ3S/llKFAOlJ84UyYM98oHjPHgYY3F7FL0OrljqOzg8++8jmqQw7A
         O5n5KKQspBxCRl24VEYndxfcbPND9j7SmWztWHYdSuVM/njdzkK1jbGeu/q+wYu+k1tw
         8TTcdzkzuBj6AUmwdDxqdavz+slVMsWbwdX+qKe1b1YYNz7v1oMCb8aIIpb7FBEk2qd1
         WQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779725963; x=1780330763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YA+/JJXQ9abERc/NViF0XyaL5qdJ2pUb4chRkVwshY=;
        b=k3jiZCgky4hJE/XUP4j5VHsoAyf92TouXraSb3WH14QWqHgkpEJieLOmR62jthSktM
         EsnHsnDlNqKc9mM6KH7waLede4Z4toD3hVuGWepWvUKK0m8v0ccP5zg0k7Yl4Hj6vrDt
         ypbxK7yfJDjlPJcsubjOV3K5asxsADRKNa8U4j7q2Pta1gP6Z+iuiNXe5Dzhrp+S7w3m
         J/VhGqfVSgPCasseJioU0qmvVTK2yfsKy4BBBPLALJbaeXWhfIHVWHQg1Ea8J1GKF1Bd
         0rsWJrLBQNRH9eMVJVGYJvSX/T0PYmDyNEZpiVzxv8ZUozDO+R84OE40VNQOBeEZr6De
         XB5g==
X-Forwarded-Encrypted: i=1; AFNElJ8vth1d9bXM4Ts6R4ZmZeHOyBgOMCBWyeZ4sWIhxaYIRUIPG0BtnXS0p9KwCthcALKKiopnwu4s2L3d6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCNfCntWG/Z6+1armsRJlOS/TchBaoztVNsfI9kbIerzHNTmGZ
	Dbbfwj3+tvcBg9VmUGmmyhx5EZpFxKdfFgsMOAHCAnCrjcuRVpVkPgYZgnFejju8Ak4=
X-Gm-Gg: Acq92OEHyLHMVKYy/fg8djfof3vRVt4zsbj3JsLgqIRDcnMNK7hBFBTZXaJeSYy1qkZ
	tdh24hfGfUD9Tx2lBxRbt8RMZKqTBUbx2ypH4k7vh7HixTDlX59lDd9JD2vbbaU1ckIMBBAIyur
	jc4eaB44/Xm+u4ekgtIoDBTvIMlhmydESjodzmICtkMbvZ/lGuCeB/mDHAwaUUcPXtVuqmAQlhY
	Bj9IIXmIprW4nDd0hGWy5b4GjPNkVsDFypEZTMsOuUe4SPU9uS54itziSXk4GEjw5uVwxjikIYB
	/Z4ig5bx1l3wObE5fz75F67wbUHxw013fo8D9ZkYDoGnLKBXBpZcYu9nN3g1CgTHqizmMkMUYkp
	a5QxQiITjG5X1c76W7zR1aqnf/bZrL7Jj7yt5i1pjB1qHeIJUYgJTtIr3S2ItXuG0c2g7oxZ27K
	HIUOoTta/bKiikhzf2pofYDY/w0jSVXPjVrys3yNuHueMztD6qazsCSizJcpUU3GtaMM2lVAKdf
	v99sH2N4qWHktrqPGP8uunMg/QniUbLwJrFg6hlpCbswdXpsFVFiCothhIIoBqX++3Ouw==
X-Received: by 2002:a05:600c:3b07:b0:490:f7c:b19 with SMTP id 5b1f17b1804b1-490420f67f5mr197977845e9.0.1779725963153;
        Mon, 25 May 2026 09:19:23 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49059cc9a91sm48939425e9.1.2026.05.25.09.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 09:19:22 -0700 (PDT)
Message-ID: <a4c7ccee-6189-4c74-bad8-57d1438c7d8d@suse.com>
Date: Mon, 25 May 2026 18:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] moduleparam: Add seq_buf-based .get callback
 alongside .get_str
To: Kees Cook <kees@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Pengpeng Hou
 <pengpeng@iscas.ac.cn>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Corey Minyard <corey@minyard.net>, Gabriel Somlo <somlo@cmu.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bart Van Assche <bvanassche@acm.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>,
 Tiwei Bie <tiwei.btw@antgroup.com>, Benjamin Berg <benjamin.berg@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Georgia Garcia <georgia.garcia@canonical.com>, kvm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-modules@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-um@lists.infradead.org,
 linux-acpi@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 qemu-devel@nongnu.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260521133315.work.845-kees@kernel.org>
 <20260521133326.2465264-6-kees@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260521133326.2465264-6-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iscas.ac.cn,nod.at,cambridgegreys.com,sipsolutions.net,minyard.net,cmu.edu,redhat.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,acm.org,ziepe.ca,ideasonboard.com,google.com,suse.de,HansenPartnership.com,oracle.com,arm.com,linuxfoundation.org,rowland.harvard.edu,linux.alibaba.com,akamai.com,antgroup.com,orcam.me.uk,infradead.org,linux.ibm.com,alien8.de,zytor.com,atomlin.com,linux-foundation.org,canonical.com,paul-moore.com,namei.org,hallyn.com,vger.kernel.org,googlegroups.com,kvack.org,lists.ubuntu.com,lists.infradead.org,lists.sourceforge.net,nongnu.org,lists.freedesktop.org,lists.ozlabs.org,lists.one-eyed-alien.net,lists.linux.dev];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-62726-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[98];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,suse.com:email,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 1FBE35CCBF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 3:33 PM, Kees Cook wrote:
> Add a new struct kernel_param_ops::get callback whose signature
> takes a struct seq_buf instead of a raw char buffer:
> 
>   int (*get)(struct seq_buf *sb, const struct kernel_param *kp);
> 
> The previously-legacy .get field is now .get_str (char *buffer);
> .get is the new seq_buf-aware form.  param_attr_show() prefers .get
> when set, otherwise falls back to .get_str.  WARN_ON_ONCE() if both
> are set.  Return contract for .get:
> 
>   < 0 : errno propagated to userspace; seq_buf contents discarded
>   = 0 : success; length derived from seq_buf_used()
>   > 0 : forbidden; the dispatcher WARN_ON_ONCE()s and treats as 0
> 
> The default policy on seq_buf_has_overflowed() is silent truncation,
> matching scnprintf()/sysfs_emit() behaviour.  Callbacks that want a
> specific overflow errno can check seq_buf_has_overflowed() and
> return their preferred error.
> 
> No callbacks use .get yet; the legacy path is still the only one in use
> after this commit. A subsequent commit teaches DEFINE_KERNEL_PARAM_OPS
> to route initializers by type.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

