Return-Path: <linux-media+bounces-52608-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLopNJqHjGmHqgAAu9opvQ
	(envelope-from <linux-media+bounces-52608-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 14:43:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 159CA124E12
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 14:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 379F230191A7
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 13:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601852F49F0;
	Wed, 11 Feb 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="AzvX818i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65805191F94
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770817400; cv=none; b=aml9T55Gr39Pbc4pvdmYumrkWjVLa2ka04QCKWRbJPTW3uShYTu+O//FsAhgBJZGFYBgwNOBn48YG0BDikgs/2UtAyhmp/froFSMjDcdeQpdiWbCBBULjbWcDi3Zavv0VJhLH5/tNiLvvuTVCOE+3kgrlScdZpnaU+nAkp0G4/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770817400; c=relaxed/simple;
	bh=QM3Mo7mLeSHu1hU7LX9/FdQYo0PSovytQRy1ZreRZpI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=nY+OMQj0idVAkj3NDQlXX5oDHBjM6CFlMA2jkdR67G0J6TX6lWoYt0G0OPL8X2+Euhsr98k4oYpkTbsUg1zSdA//7HKujUsKdx6VWvSCuMXz2Kp2xg3/RJki+O2srQqHbThfpo2lB3bwqPYbf/A+AMbD1czjgj+ti9tFLfGXeeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com; spf=pass smtp.mailfrom=tutanota.com; dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b=AzvX818i; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutanota.com
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id C4F9510BD47BF
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 14:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770817397;
	s=s1; d=tutanota.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=6SJRPizldFxZe9bSCcasHL3MytvyEuxH+Zw4TlFCTAA=;
	b=AzvX818ixqx4Okqk152+OkVmRsOC7Z6C0Zgim6+iJ0mhMKMOsy+il7uO2FD5FbPm
	QvB7Ec2QeYatOYN9VQMP64uo4TAX6en/IdEa4xaMxuXlLIHlZq0PFm/fY+1azjDQJJU
	0cf1MvEXHSX5j06PzSMlF+dN8g6mNmyUIMGyB8mM+N4G76ZK3f0t/QknozFpwpwOm5h
	cNxzYTzrtdZpX3X7lV1ZaqC7fMSTVgypinZ44cKKb2+PH4tvdDcTLqNWbmdp2Jt6gwD
	+2yJN9+TVGCXEe28KqaIBY4ZjpGTaqSrgwwwdoERUlT/fQ2uKyRJRPlEezEkVoXGdIO
	bhdz/CcGbg==
Date: Wed, 11 Feb 2026 14:43:17 +0100 (CET)
From: soufianeda@tutanota.com
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linux Media <linux-media@vger.kernel.org>,
	Linux Staging <linux-staging@lists.linux.dev>,
	Gregkh <gregkh@linuxfoundation.org>,
	Johannes Goede <johannes.goede@oss.qualcomm.com>,
	Andy <andy@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <OlBwH9n--F-9@tutanota.com>
In-Reply-To: <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com> <aYt-vrc7h7CJOmSu@stanley.mountain> <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: 01942f2d6730cf62a97c7cea648ee3955a02563caa9cabc06f7a1657ed38cd89e45b3b265ac75872da62f850375ec2fec65ecca3f233db501351f9ed31f2eeac4a:TurnOnPrivacy!:tutamail
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tutanota.com,quarantine];
	R_DKIM_ALLOW(-0.20)[tutanota.com:s=s1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-52608-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[soufianeda@tutanota.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tutanota.com:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tutanota.com:mid,tutanota.com:dkim,tutanota.com:email]
X-Rspamd-Queue-Id: 159CA124E12
X-Rspamd-Action: no action


Hi Sakari,

I agree that removing the private IOCTL handler is the better
approach. While fuzzing the driver I found the same class of
unchecked user-controlled size fields in several other handlers
(ATOMISP_IOC_S_DIS_VECTOR, morph table, shading table), so
removing atomisp_vidioc_default() eliminates all of them at once.

I'm cool with sending a patch removing atomisp_vidioc_default() as
Hans suggested, if that would be helpful.

Regards,
Soufiane Dani


11 Feb 2026 at 09:11 by sakari.ailus@linux.intel.com:

> Hi Dan, Soufiane,
>
> On Tue, Feb 10, 2026 at 09:53:50PM +0300, Dan Carpenter wrote:
>
>> On Tue, Feb 10, 2026 at 04:26:31PM +0100, Soufiane via B4 Relay wrote:
>> > From: Soufiane <soufianeda@tutanota.com>
>> > 
>> > Validate sizeimage against the allocated frame buffer size before
>> > hmm_store() to prevent out-of-bounds write.
>> > 
>> > Signed-off-by: Soufiane <soufianeda@tutanota.com>
>>
>> We need a Fixes tag if the bug is real.
>>
>> > ---
>> >  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> > 
>> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>> > index 3a4eb4f6d3be..ca7ffc7855ac 100644
>> > --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>> > +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>> > @@ -3326,6 +3326,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
>> >  		goto err;
>> >  	}
>> > 
>>
>> There is some sketchy stuff happening in this code but I'm not sure I
>> understand the issue.  The code looks like this:
>>
>>  3317          /* Note: the padded width on an ia_css_frame is in elements, not in
>>  3318             bytes. The RAW frame we use here should always be a 16bit RAW
>>  3319             frame. This is why we bytesperline/2 is equal to the padded with */
>>  3320          if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
>>  3321                                         sh_format, padded_width, 0)) {
>>
>> This allocates res.  Why would it allocate something smaller than
>> arg->fmt.sizeimage?  How did you find this bug?  By testing or reading
>> the code?  Do you have a reproducer?
>>
>>  3322                  ret = -ENOMEM;
>>  3323                  goto err;
>>  3324          }
>>
>> > +	if (arg->fmt.sizeimage > res->data_bytes) {
>> > +		ret = -EINVAL;
>> > +		goto err;
>> > +	}
>> > +
>>
>>  3325 
>>  3326          tmp_buf = vmalloc(arg->fmt.sizeimage);
>>  3327          if (!tmp_buf) {
>>  3328                  ret = -ENOMEM;
>>  3329                  goto err;
>>  3330          }
>>  3331          if (copy_from_user(tmp_buf, (void __user __force *)arg->base,
>>  3332                             arg->fmt.sizeimage)) {
>>  3333                  ret = -EFAULT;
>>  3334                  goto err;
>>  3335          }
>>  3336 
>>  3337          if (hmm_store(res->data, tmp_buf, arg->fmt.sizeimage)) {
>>  ^^^^^^^^^
>> The worry is that the buffer this references is too small.  I would
>> prefer instead if there were some bounds checking before the memcpy()
>> calls in hmm_store().  They would use a different, smaller limit if
>> only part of the buffer could be used.  I don't know if that bounds
>> checking is really required though...
>>
>
> Indeed. Beyond that, even I have to admit I have little idea what this
> IOCTL is supposed to be doing. Possibly feed in a raw frame for processing?
> But that's not supposed to be implemented like this... The TODO file
> contains an entry that says "Remove/disable private IOCTLs" -- we should
> move to use parameter buffers instead.
>
> I'm not sure anyone depends on these IOCTLs at the moment, but definitely
> some obviously are associated with some risk.
>
> The world looked different when this code was written.
>
> I'd disable all private IOCTLs in the driver, with the possible exception
> of ATOMISP_IOC_S_ISP_PARM, which is close to the parameter buffer approach
> already.
>
> Also cc LMML, Greg and Andy.
>
> -- 
> Kind regards,
>
> Sakari Ailus
>


