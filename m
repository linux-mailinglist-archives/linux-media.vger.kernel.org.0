Return-Path: <linux-media+bounces-52196-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLqWIEZrg2m3mgMAu9opvQ
	(envelope-from <linux-media+bounces-52196-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 16:52:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A1AE9852
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 16:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4ADF3037E18
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 15:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D692426D34;
	Wed,  4 Feb 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlsy0GNH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FEE2D8768;
	Wed,  4 Feb 2026 15:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770217628; cv=none; b=UPPF7G5t7tNUy7Yt+L3N6desKjcXBovUgRUzyG/+1WvhaCzfRcmO3MfgnEyNX58LjxQXHGquwulxjFwHVGDUAm9b1oXzWhj+Z4qFIP1k3QELGW1GOpRwMcHtA5oXgSAec+fK6SPFuV7ga6HighoNOmm1vZGg9ObM3YAPOfUiy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770217628; c=relaxed/simple;
	bh=u7+OkXsIfjUHdttckknu3fgyPai8EyteFWkUzaNGG74=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/fsUaS6a4LKyzoT6a1HhUNSP2so3rPHmUgajVVqzzNMsJponb6W5Vn0pvv74+dg3BxkGdC2uuyIJ3r433cjk3HKWjXBmyoKCOj8he9050gX3LgFkv4ktmYKOOJcKqJP+QvbIkAZGer7BwVJab232D6AG9H5O4fTqNNwCUtXask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlsy0GNH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29B2C116C6;
	Wed,  4 Feb 2026 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770217627;
	bh=u7+OkXsIfjUHdttckknu3fgyPai8EyteFWkUzaNGG74=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mlsy0GNHFNvFT/7ibpAllpVbf2OctK0IBhyyGVUp2UQbswBHfFm6pnuYaT3BIaU8t
	 sCUgxFAxReVeDQi8dUpFaJpqhZNWMFatpPLn4Ahg0SaVlaV94LxfUHJmLpOZLKeylV
	 mCHbg7108pSsKObRpqv2jQpLNejRAKYPqjK40FPw6HTwPXLfmCz2AeGY6PPAyDC4p3
	 1BDeB6nWeRN6q7G0Cxke5tB3aoR6TFYjFPSpBqPLe/qcQbx9zwPpT0NyukL0rwzHGq
	 H7dJnW+u/ATn1lPdMwlWNQTPmFr8CrroRu399m/+rgbpp9QTMIFdc86euhp/kKsa52
	 qPAB1mOtZBp0Q==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vneTB-00000005VGt-32de;
	Wed, 04 Feb 2026 16:07:05 +0100
Date: Wed, 4 Feb 2026 16:07:04 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Sean Young <sean@mess.org>
Subject: Re: [PATCH 2/2] docs: media: media-committer: do some editorial
 changes
Message-ID: <20260204160704.0741bbba@localhost>
In-Reply-To: <ada3056177e5e4e65119fb1b617777a680534e64.1770215865.git.mchehab+huawei@kernel.org>
References: <dc12b2f42304866ccc04053f2a3c97e84c7558a1.1770215865.git.mchehab+huawei@kernel.org>
	<ada3056177e5e4e65119fb1b617777a680534e64.1770215865.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52196-lists,linux-media=lfdr.de,huawei];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83A1AE9852
X-Rspamd-Action: no action

On Wed,  4 Feb 2026 15:37:45 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Do some editorial changes to make it look clearer:
...
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../driver-api/media/media-committer.rst      | 97 ++++++++++---------
>  1 file changed, 51 insertions(+), 46 deletions(-)
...
> @@ -85,7 +89,7 @@ rules::
>  
>     I agree to follow the Kernel development rules described at:
>  
> -   https://www.kernel.org/doc/html/latest/driver-api/media/media-committer.rst
> +   https://www.kernel.org/doc/html/latest/driver-api/media/media-committers.rst
>  
>     and to the Linux Kernel development process rules.

Heh, this change is obviously wrong, except if we rename the rst document
to also be media-committers.rst, which sounds a good idea to me:

- Use "media-committers" for both the .rst file and for the git tree.

So, please rename the file on v8 (or otherwise fix it here)

-- 
Thanks,
Mauro

