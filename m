Return-Path: <linux-media+bounces-10622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B068B9D45
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 17:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 096B61F228AC
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 15:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F7315B971;
	Thu,  2 May 2024 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OD8Ua5c2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t7FFyFo2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OD8Ua5c2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t7FFyFo2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1415B56C
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714663183; cv=none; b=ioReZHtlic0alcTmbESBLlzR0gB0lm5O7nzEYXPvMk8Vf9G5r+9/OmJDFw2oV8vAcmgJnigDRSY2YfmDCOt9xLs1yQt4lQpf8+WER1us0WfI1Ddrqk2gQOr/Bk1iiexdHzdQDJXBtOfzwiaug9+ZNQDI+FhG0SYNTWujmCAT5X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714663183; c=relaxed/simple;
	bh=eTziytJsKNwSjYLBgrjv4MbHXLfyo8jRufpyYN8cC+0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sxq2KI6QPE1StFpZkMt63Dn0LUAiA59W9iKxzvtQ8Q+VMFuG/xJxahQecIo8gHKKh17W+hQBrnJ0EA3x7qa3w1urt7IpDRyI0TAG6ILhVFaz2gNrDncD7SeJnOgTf5aKvWPdVi4xO1xwcP+avOPOivKxkh5cLh8p7I4/g36xaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OD8Ua5c2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t7FFyFo2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OD8Ua5c2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t7FFyFo2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B361F37203;
	Thu,  2 May 2024 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714663179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LaWSYJrdmLJAmx+oUOdvAZd9/qLvPubgyh9y+0Zjn/w=;
	b=OD8Ua5c2oxlMmJ8txQatD0igh9+7x/HJqWsNrBbCcnlIbwVJPIy2GWEsBVqTUc2fhpNRNU
	hildf0g3TtQcFSBEJyuoExZI5HWpzppdD46P+swMMvqFce6B9MdBQ511k6aJg63Tj1MwLZ
	mqdpfeoHAEi/SEBKPkrd/cu1YzR+juM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714663179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LaWSYJrdmLJAmx+oUOdvAZd9/qLvPubgyh9y+0Zjn/w=;
	b=t7FFyFo2hG2kYZ5g8nZmyKhWm3F8kRlfb6EqBCUzE0vnf2GHUZYITUVb6DvhCat8gsW1Aw
	T2dIgpLEJuHZFCAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714663179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LaWSYJrdmLJAmx+oUOdvAZd9/qLvPubgyh9y+0Zjn/w=;
	b=OD8Ua5c2oxlMmJ8txQatD0igh9+7x/HJqWsNrBbCcnlIbwVJPIy2GWEsBVqTUc2fhpNRNU
	hildf0g3TtQcFSBEJyuoExZI5HWpzppdD46P+swMMvqFce6B9MdBQ511k6aJg63Tj1MwLZ
	mqdpfeoHAEi/SEBKPkrd/cu1YzR+juM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714663179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LaWSYJrdmLJAmx+oUOdvAZd9/qLvPubgyh9y+0Zjn/w=;
	b=t7FFyFo2hG2kYZ5g8nZmyKhWm3F8kRlfb6EqBCUzE0vnf2GHUZYITUVb6DvhCat8gsW1Aw
	T2dIgpLEJuHZFCAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9340413A25;
	Thu,  2 May 2024 15:19:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gexqIguvM2aIdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 May 2024 15:19:39 +0000
Date: Thu, 02 May 2024 17:19:52 +0200
Message-ID: <87plu4i6lj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	"Yang, Chenyuan" <cy54@illinois.edu>
Subject: Re: [PATCH for v6.10 0/4] media: cec: syzkaller fixes
In-Reply-To: <cover.1714649924.git.hverkuil-cisco@xs4all.nl>
References: <cover.1714649924.git.hverkuil-cisco@xs4all.nl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-2.71)[98.72%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[xs4all.nl];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[xs4all.nl];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]

On Thu, 02 May 2024 13:38:40 +0200,
Hans Verkuil wrote:
> 
> Chenyuan Yang found a bunch of syzkall issues:
> 
> https://lore.kernel.org/linux-media/PH7PR11MB57688E64ADE4FE82E658D86DA09EA@PH7PR11MB5768.namprd11.prod.outlook.com/
> 
> The patches in this series fix the various issues, and with these
> in place, it passed the syzkaller tests.
> 
> Many thanks to Chenyuan for reporting this and doing all the testing,
> since I had a hard timing reproducing them. It took a few months to
> track it all down because of that.
> 
> Regards,
> 
>         Hans
> 
> Hans Verkuil (4):
>   media: cec: cec-adap: always cancel work in cec_transmit_msg_fh
>   media: cec: cec-api: add locking in cec_release()
>   media: cec: core: avoid recursive cec_claim_log_addrs
>   media: cec: core: avoid confusing "transmit timed out" message

Thanks for your patient bug hunts!


Takashi

