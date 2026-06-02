Return-Path: <linux-media+bounces-63431-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zOY3JvI+H2pgjAAAu9opvQ
	(envelope-from <linux-media+bounces-63431-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:37:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBABD631C8B
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:37:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AintMm8E;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63431-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63431-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA57F307D8E0
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 20:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711AA371049;
	Tue,  2 Jun 2026 20:29:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34AE2594B9
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 20:29:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432174; cv=none; b=i8h7kNscbFk5bh1DhTmRy4JgKAJR8y7EPH0gW4mXCsgS8/BhuuAuqk9SpSkiWeHOEy98aRmSvEbL/Sjs2pteD+OO0KVgjvWhzxL4Xi7/H8mo1LKZtL3aypQaZkPTnsVOiE4Rx38iGufOwyA55ujKYRRQJMxYqT96bgjVcWwT3hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432174; c=relaxed/simple;
	bh=fBoVPqcxA4r7AzSegbTcZH2wrV0QG3PJJJQWIFMRxd8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FuyFEBMHHgSWb9TGxeEX7mSO4sR7fw8CAmXzvCXzfpPUIAXngcIwglv/3QoZRG5deSx4xz5ZIQnSXVrp3saf7EXTkn3+bIhrbBmYV1eggXsO9UDJM40bkpA/tPDQM5aXNx2cYn9LG8/qowEt/iGhfWk8PIdcLqicRvvECeqLyR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AintMm8E; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91601F00893;
	Tue,  2 Jun 2026 20:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780432173;
	bh=TJxeR+31ghkyxyfYVDHOK0nPODOZzK8Gyh8s4juPGnE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AintMm8E9/a95sr/+pM2hotBfW0GQ9HHIrq4gDydep75PRw3FLkkNJuTvrGHOBp5Q
	 PYnPQKdyhRZXtx+A848igSOAZe4era6e2GYfgTcFcAX6yqyWEPKT7Q76YCGpu/bOEo
	 VkGciHuaXS9IUXE8Vko00vp2R668QDFYZBxFE0oL2NvhdOUz+H6/xgSl3cvVNSTzYm
	 hEIz4muDwYyyiw6sOGcEQQXjrLnnCRZwnJ8h9vkm1Hl+PD0qPzqM4noVNxhlvc2OYG
	 IcpDX35HsH8vLHDUGD3ZlunuYrRCKflxjl8GX5lvT0WdbDdeyjGeeXB+BxoEbVAG9r
	 hfF4xgQabdAoA==
Date: Tue, 2 Jun 2026 22:29:28 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Derek Barbosa <debarbos@redhat.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260602222928.51cc1063@foz.lan>
In-Reply-To: <20260602183955.GJ2487554@ziepe.ca>
References: <20260530103004.6fe2ffa7@foz.lan>
	<7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan>
	<20260530204945.22ac92c6@foz.lan>
	<20260530205351.19847fc8@foz.lan>
	<ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
	<20260602185115.4b5c4886@foz.lan>
	<20260602183955.GJ2487554@ziepe.ca>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_HTML_ONLY(0.20)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63431-lists,linux-media=lfdr.de,huawei];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:~];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:debarbos@redhat.com,m:roman.gushchin@linux.dev,m:konstantin@linuxfoundation.org,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,foz.lan:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBABD631C8B

On Tue, 2 Jun 2026 15:39:55 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, Jun 02, 2026 at 06:51:15PM +0200, Mauro Carvalho Chehab wrote:
> > On Tue, 2 Jun 2026 11:51:42 -0400
> > Derek Barbosa <debarbos@redhat.com> wrote:
> >   
> > > On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:  
> > > > 
> > > > In time: problematic in the sense that the first project that
> > > > picked it is likely the patch "owner": the token will require
> > > > maintainership on such project.
> > > > 
> > > > In practice it would mean that the token used on patchwork instances
> > > > with multiple Kernel projects may need maintainers permission on all
> > > > such projects, as otherwise patchwork update will fail.
> > > > 
> > > > Thanks,
> > > > Mauro
> > > >     
> > > 
> > > Hi Mauro,
> > > 
> > > Just to recap the the thread, to confirm that I am following it correctly:
> > > 
> > > - Patchwork only supports a single URL mask for message-ID lookup (lore or
> > >   sashiko). Adding a sashiko link would require diverging from upstream.  
> > 
> > Not sure what you mean.
> > 
> > AFAIKT, a RFC-822 application can have just one message-ID per message.
> > 
> > For message lookup, patchwork works using its own patch ID, or via a search
> > to the original message ID that contains the patch. So, no, it won't be lore
> > nor sashiko, as neither lore nor sashiko write e-mails ;-)  
> 
> He means the hyperlink patchworks adds, ie look here:
> 
> https://patchwork.kernel.org/project/linux-rdma/patch/20260602140453.3542427-1-arnd@kernel.org/
> 
> See the near top of the page "Message ID" section 
> 
> Message ID	20260602140453.3542427-1-arnd@kernel.org (mailing list archive)
>                                                            ^^^^^^^^^^^^^^^^^^
> 
> That hyperlink goes to lore, Kostantin set this up
> 
> What I suggested as a very basic first step is a second hyperlink to
> Sashiko, which I guess needs upstream to adjust how they generate this
> html.

If you want exactly like that, it would require patchwork changes(*), but
see that CI checks context have their own link as well, like here:

(*) to be more precise, it will require changing an html template 
    (templates/patchwork/submission.html). There it says how a patch
     is shown.

    The message ID part is like this:

	{% for sibling in submission.series.patches.all %}
            <li>
	{% if sibling == submission %}
                {{ sibling.name|default:"[no subject]"|truncatechars:100 }}
	{% else %}
              <a href="{% url 'patch-detail' project_id=project.linkname msgid=sibling.encoded_msgid %}">
                {{ sibling.name|default:"[no subject]"|truncatechars:100 }}
              </a>
	{% endif %}
            </li>

	...

    And the CI checks are:
	
	{% if checks %}
	<h2>Checks</h2>
	<table class="checks">
	<tr>  
	  <th>Context</th>
	  <th>Check</th>
	  <th>Description</th>
	</tr> 
	{% for check in checks %}
	<tr>  
	  <td>{{ check.user }}/{{ check.context }}</td>
	  <td>
	    <span title="Updated {{ check.date|naturaltime }}" class="state {{ check.get_state_display }}">
	      {{ check.get_state_display }}
	    </span>
	  </td>
	  <td>
	{% if check.target_url %}
	    <a href="{{ check.target_url }}">
	{% endif %}
	    {{ check.description }}
	{% if check.target_url %}
	    </a>
	{% endif %}
	  </td>
	</tr>
	{% endfor %}
	</table>
	{% endif %}	

Yet, if you see how the above template is parsed, here, for instance:
	https://patchwork.linuxtv.org/project/linux-media/patch/20260530143541.229628-4-phasta@kernel.org/

Btw, on media patchwork, we're using Patchwork v3.2.1 as is, with just one 
or two fix patches on the top of it (and with series patch from an upstream 
PR merged) and no template changes.

You'll see there that media-ci added 4 contexts to this patch, 
each with its own link URL (all descriptions there are "Link").
Each {target_url} field there goes directly to the media-ci logs.

My bot added just one for sashiko (and if we had LKP and/or
sysbot for the same patch, it would be shown there as well as
separate lines). 

As this came from an unsigned e-mail, I'm opting to place there
a link to lore, as it already sanitizes URLs, hopefully avoiding them
to point to some malicious site.

I might have placed instead a link to sashiko CI output, but on
such case, I would like require a gpg signature to validate the e-mail
content, as adding links received by e-mail without first validating
its origin is not good from security point of view.

> Integrating as CI reports and so on would be nice if someone can
> manage it for all the kernel.org patchworks :)

No idea what you meant as "CI reports", and what this is different
from what we have today already implemented on patchwork.

Thanks,
Mauro

