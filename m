Return-Path: <linux-media+bounces-63752-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yTgnG4shIWrS/QAAu9opvQ
	(envelope-from <linux-media+bounces-63752-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:56:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE83763D666
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:56:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=K4ZJAzwI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63752-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63752-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A03F530866F2
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 06:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1393D34A6;
	Thu,  4 Jun 2026 06:52:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30A03C09EC
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 06:52:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555926; cv=none; b=kdf4X8fyVdm4IIi4ighi1cehvWjrsW5fjdOjJAJaP28hzOXpyyvTDpslEo9g2CDD9IOhgZRW1vaygZ4Okmn5SPU1jwQZUFWM6HNSR45nT8LTSLueOFVmL+VzK/zErbVeF2AQlIFaDYI4WGcrYpOvKp9ProFTvZgD4k2PisT+d3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555926; c=relaxed/simple;
	bh=Rn86CgN7l7bAlkm4Smst4I5O6nfTULlK4fHc9Y8kq4M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzff0IDNE/OwFD8HTItg+J1u1J0bj3nQG/yyw71n/UZ7LdGaCDUS6r3h1Ora9//ExRAuxffml62yWAqMK9GN3JCSGurOBNRUgx0zJd49no5Y0j5/4nzVXQzia9Y5U3FgXozsVAckj51Bwi7WCMxM1N35ZOLLiuLTTYJj5Z89sMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4ZJAzwI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49A21F00893;
	Thu,  4 Jun 2026 06:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780555925;
	bh=Eauo2JMuJMYxPFLQ7sCMCKIbfvH6HGsfjTY1C2+AWi8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=K4ZJAzwI5LTNTeTGLGXgFhc/cIMhTpFrsxl6TT54Alb0vEeTU8/TbMgCfTxKNG5z9
	 2cpoz2YXwQyKL5n7fdBqHkZ1d1peKxjEac7+BnZ8BSbFL40f8SQHBdVgGVm3cEtBfZ
	 BXHWBOlqRVAbTtWeUZ3B2MEvRn3Y9CkgtO8e38JGDWIfT6ZN0qa6EGNf6zvD8z4hU2
	 lM3xKy0YLzCVODX7ezHwScLJZeJwVSyBekeGCQFsgZZpMdx+kdgU+Tb1keu7R6m1y3
	 Rc8xl543WkVxr92t6Hp0yhX4DRt/FZAMSKCWD95UGa6PK9Phe1kcTP7lM+bF3DN/XX
	 eFw29HsnCfFyg==
Date: Thu, 4 Jun 2026 08:52:01 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Derek Barbosa <debarbos@redhat.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260604085201.177ad537@foz.lan>
In-Reply-To: <b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
References: <20260530103004.6fe2ffa7@foz.lan>
	<7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan>
	<20260530204945.22ac92c6@foz.lan>
	<20260530205351.19847fc8@foz.lan>
	<ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
	<7ia4tsrkn1k4.fsf@castle.c.googlers.com>
	<20260602223936.27def657@foz.lan>
	<b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
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
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63752-lists,linux-media=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:matttbe@kernel.org,m:debarbos@redhat.com,m:roman.gushchin@linux.dev,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:email,vger.kernel.org:from_smtp,djangoproject.com:url,foz.lan:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE83763D666

On Wed, 3 Jun 2026 09:50:06 +1000
Matthieu Baerts <matttbe@kernel.org> wrote:

> Hi Mauro, Derek, Roman,
> 
> On 03/06/2026 06:39, Mauro Carvalho Chehab wrote:
> > On Tue, 02 Jun 2026 20:13:15 +0000
> > Roman Gushchin <roman.gushchin@linux.dev> wrote:  
> >> Derek Barbosa <debarbos@redhat.com> writes:  
> >>> On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:    
> 
> (...)
> 
> >>> - pw_tools is a workaround solution to get/set status on patchwork via bot-mail
> >>>   parsing. pw tokens also have broad permission scope.
> >>>
> >>> which that leaves us with two "methods" of integration:
> >>>
> >>> 1. The Sashiko daemon calls the pw_tools script directly to update the status.
> >>> 2. Sashiko sends a single-per-patch-email with parseable "status" to a mailing
> >>> list, where some running daemon will pickup the mail.    
> >>
> >> This feels a bit hacky.  
> > 
> > The alternative that would be acceptable, at least on media, is if 
> > one would add support on patchwork to have a separate permission just
> > for checks update.  
> 
> Indeed. It looks like there is an old feature request about that:
> 
>   https://github.com/getpatchwork/patchwork/issues/14
> 
> Linked to Mauro's email from Dec 2015 :)

If it is OK to have a global CI permission, I think this patch
would do the trick (currently untested):

diff --git a/patchwork/api/check.py b/patchwork/api/check.py
index 74bbc19e0078..79326a96a5bb 100644
--- a/patchwork/api/check.py
+++ b/patchwork/api/check.py
@@ -108,9 +108,23 @@ class CheckListCreate(CheckMixin, ListCreateAPIView):
     lookup_url_kwarg = 'patch_id'
     ordering = 'id'
 
+    def is_editable(self, user):
+        if not user.is_authenticated:
+            return False
+
+        # Only users with add_check permission can do it.
+        # Notice that this is a global permission: it allows
+        # adding checks to any project inside Patchwork.
+        if user.has_perm('patchwork.add_check'):
+            patch._edited_by = user
+            return True
+
+        # Being maintainer doesn't grant rights to create checks.
+        return False
+
     def create(self, request, patch_id, *args, **kwargs):
         p = get_object_or_404(Patch, id=patch_id)
-        if not p.is_editable(request.user):
+        if not self.is_editable(request.user):
             raise PermissionDenied()
         request.patch = p
         return super(CheckListCreate, self).create(request, *args, **kwargs)

The idea here is to use Patchwork Django's admin screen, at
Users section, setting:

	"patchwork | check | Can add check"

Created by Django's default_permissions[1] for class Check(models.Model)
(at patchwork/models.py).

[1] https://docs.djangoproject.com/en/6.0/topics/auth/default/#default-permissions

The only issue is that the permission would be granted patchwork-wide. 
I suspect that this is probably ok for Kernel.org.

On media, we have a VDR project with is not a kernel tree and has
separate maintainers, but we don't use CI there. So, it can work
for us as well.

I'm not a django expert, but perhaps there's a way to create also
a set of per-project permissions to allow to either set this globally
or per project.

Thanks,
Mauro

