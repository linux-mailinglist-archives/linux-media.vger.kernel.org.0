Return-Path: <linux-media+bounces-61853-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHJfEpbpCWpavAQAu9opvQ
	(envelope-from <linux-media+bounces-61853-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 18:15:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41D65623B5
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 18:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E4A93019F10
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 16:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010CD34BA42;
	Sun, 17 May 2026 16:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="kK3VDQIl"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD55352C5C;
	Sun, 17 May 2026 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779034503; cv=pass; b=KL971VNLOChcrcshVNyFdNqmsV0O62NFt0dmhLcUIAdVyWTXOtlrWIqjrGKPlY6pLNNCMue3/ZR4l/2e3bhwbQLYo0EJtfWnf+6pAPzxhMmTOykp5coiBZ6lCLcRyd7aMMH3G5RIQqhyDQjadejwU+ma0WBXD38/pahfUz5xVvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779034503; c=relaxed/simple;
	bh=zciJ29y6V7yiCwg5Y+ZUNqXXnQi5wfbsoF5QJvupyeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r9yBmAESUPUXnY54N3q1iBgGZXsHO6ADBOTzbRo0/SxJ2qcy3KwxJy3zVRtlykPSFveVbE4X/EMS+Z9WqO9HmPX7u+r+aGQ6yqtvMdT8T3vyPJXWoM+UPbENNU+5EVjo3s2+xMHIcgeCsAOGVxp0ZrUDHEN/ettqi90d/lA8xtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=kK3VDQIl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779034483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M0Xub1lCq4wl/BRc1gcF4eJJCj/eSpnhkULjWNDElqQiyTW0UNbh3QJHtzkqlvUMpazbWCRIaca47D91LHTc4F0McBwD0MneF/WTNjeecN72k/unFO0eWUxDXcjdAx5fjKfY4DkMvac0cTGq9msZG9WAQVivFdoaWmF66X41GaI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779034483; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lTQnY3Wob79n+0pHlloPg9VDdqG3m8pLTGa60m2YmDw=; 
	b=HvhX71YnZ/4RKA5Sdq19cWUGLngYf6644gM99bCMz8criNBBvaD5uRv0yz/Aj++2ajTvG2AshS/iX5vNsL8Rj8sXJlTK5fHdazgHSga3fvVYXxDa23xrURBuaW4gtoPDRhuZMvQ6k6feL5kdCgaT164ffRKfuVudbFUAUP9Vd8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779034483;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lTQnY3Wob79n+0pHlloPg9VDdqG3m8pLTGa60m2YmDw=;
	b=kK3VDQIlpnav25+wGvbaoQB+J+x4Rv83gqmpDLjiPvqqFJeIWS/ppTaCBsQlelAN
	myuvqeE1jQ+rwxSHlJw5p6md+w07WhslZVYbtH3Vk7C0K1VlzybzLvwaYhITUhWhgka
	eKooLOSAEMWOG8qp8KjkA0KRagncd3x+8eoYnuuE=
Received: by mx.zohomail.com with SMTPS id 17790344794755.096580494770819;
	Sun, 17 May 2026 09:14:39 -0700 (PDT)
Message-ID: <afec1199-4889-4d35-964c-4432ec792fa3@collabora.com>
Date: Sun, 17 May 2026 19:14:32 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/virtio: use uninterruptible resv lock for plane
 updates
To: Deepanshu Kartikey <kartikey406@gmail.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20260515084030.21986-1-kartikey406@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260515084030.21986-1-kartikey406@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Queue-Id: A41D65623B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61853-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,chromium.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/15/26 11:40, Deepanshu Kartikey wrote:
> +int virtio_gpu_array_lock_resv_uninterruptible(struct virtio_gpu_object_array *objs)
> +{
> +	unsigned int i;
> +	int ret = 0;
> +
> +	if (objs->nents == 1) {
> +		dma_resv_lock(objs->objs[0]->resv, NULL);
> +	} else {
> +		ret = drm_gem_lock_reservations(objs->objs, objs->nents,
> +						&objs->ticket);

drm_gem_lock_reservations() is interruptible. Given that only one BO
needs to be locked for the fix, make it
virtio_gpu_lock_one_resv_uninterruptible() and fail with -EINVAL if
objs->nents > 1

-- 
Best regards,
Dmitry

