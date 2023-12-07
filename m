Return-Path: <linux-media+bounces-1800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2828083EE
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 10:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01CD0283015
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 09:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02774341BD;
	Thu,  7 Dec 2023 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="tg8NdadU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="eNkRt1wW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC901987;
	Thu,  7 Dec 2023 01:10:26 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B8831F897;
	Thu,  7 Dec 2023 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1701940224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jXiKfid97FD5zi8RqmP75wazePMuM2Vj4JZ4H26JF/w=;
	b=tg8NdadUlk4VfBBiX/KnTc8KWn4/+I2eqU3OCsMmSGO5fGxGo+xFF7FC1+cL85+pnkxgh6
	+2Q+t+yvWpRrlmhVvY0iaqUjhOk6aDapKv8aWDgxXaeYBRQUq2bq9mHOv8yIv2mkt3uJBW
	DjcnaOKBqBG38BR6qn1JnsOv3SGRVLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1701940224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jXiKfid97FD5zi8RqmP75wazePMuM2Vj4JZ4H26JF/w=;
	b=eNkRt1wWHc2B/3UiJ7gBmgVmSJJtzZTtEviOYNX31SorNi0ot/Q0TzM7nhemVkTB8kzvHE
	aOrpBsXvOqOVy6BQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 34B3813907;
	Thu,  7 Dec 2023 09:10:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id w3HWDACMcWWqPwAAn2gu4w
	(envelope-from <jack@suse.cz>); Thu, 07 Dec 2023 09:10:24 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 7AF80A07C7; Thu,  7 Dec 2023 10:10:23 +0100 (CET)
Date: Thu, 7 Dec 2023 10:10:23 +0100
From: Jan Kara <jack@suse.cz>
To: Yury Norov <yury.norov@gmail.com>
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Chaitanya Kulkarni <kch@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Disseldorp <ddiss@suse.de>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
	Jiri Pirko <jiri@resnulli.us>, Jiri Slaby <jirislaby@kernel.org>,
	Kalle Valo <kvalo@kernel.org>, Karsten Graul <kgraul@linux.ibm.com>,
	Karsten Keil <isdn@linux-pingi.de>,
	Kees Cook <keescook@chromium.org>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oliver Neukum <oneukum@suse.com>, Paolo Abeni <pabeni@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ping-Ke Shih <pkshih@realtek.com>, Rich Felker <dalias@libc.org>,
	Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wenjia Zhang <wenjia@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	GR-QLogic-Storage-Upstream@marvell.com, alsa-devel@alsa-project.org,
	ath10k@lists.infradead.org, dmaengine@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-net-drivers@amd.com, linux-pci@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, mpi3mr-linuxdrv.pdl@broadcom.com,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v2 00/35] bitops: add atomic find_bit() operations
Message-ID: <20231207091023.kioii5mgmnphrvl4@quack3>
References: <20231203192422.539300-1-yury.norov@gmail.com>
 <20231204185101.ddmkvsr2xxsmoh2u@quack3>
 <ZXAFM2VZugdhM3oE@yury-ThinkPad>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXAFM2VZugdhM3oE@yury-ThinkPad>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 2.70
X-Spamd-Result: default: False [2.70 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_GT_50(0.00)[100];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FORGED_RECIPIENTS(2.00)[m:yury.norov@gmail.com,m:davem@davemloft.net,m:jejb@linux.ibm.com,m:haris.iqbal@ionos.com,m:akinobu.mita@gmail.com,m:akpm@linux-foundation.org,m:andersson@kernel.org,m:bp@alien8.de,m:brauner@kernel.org,m:dave.hansen@linux.intel.com,m:ecree.xilinx@gmail.com,m:edumazet@google.com,m:fenghua.yu@intel.com,m:geert@linux-m68k.org,m:gregory.greenman@intel.com,m:hughd@google.com,m:kuba@kernel.org,m:axboe@kernel.dk,m:jirislaby@kernel.org,m:kvalo@kernel.org,m:kgraul@linux.ibm.com,m:isdn@linux-pingi.de,m:keescook@chromium.org,m:leon@kernel.org,m:mark.rutland@arm.com,m:habetsm.xilinx@gmail.com,m:mchehab@kernel.org,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:dalias@libc.org,m:robh@kernel.org,m:robin.murphy@arm.com,m:seanjc@google.com,m:xueshuai@linux.alibaba.com,m:rostedt@goodmis.org,m:tsbogend@alpha.franken.de,m:tglx@linutronix.de,m:wenjia@linux.ibm.com,m:will@kernel.org,m:alsa-devel@alsa-project.org,m:linux-net-drivers@amd.com,m:mpi3mr-linuxdrv.pdl
 @broadcom.com,m:x86@kernel.org,m:mirsad.todorovac@alu.unizg.hr,m:willy@infradead.org,m:andriy.shevchenko@linux.intel.com,m:maxim.kuvyrkov@linaro.org,m:klimov.linux@gmail.com,m:bvanassche@acm.org,s:s.shtylyov@omp.ru];
	 BAYES_HAM(-0.00)[40.06%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[wp.pl,xs4all.nl];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_SOME(0.00)[];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[suse.cz,vger.kernel.org,davemloft.net,zytor.com,linux.ibm.com,microsoft.com,ionos.com,gmail.com,linux-foundation.org,kernel.org,alien8.de,nvidia.com,opensource.wdc.com,linux.intel.com,suse.de,google.com,intel.com,linux-m68k.org,linuxfoundation.org,xs4all.nl,redhat.com,perex.cz,ziepe.ca,kernel.dk,resnulli.us,linux-pingi.de,chromium.org,arm.com,ellerman.id.au,monstr.eu,suse.com,infradead.org,realtek.com,libc.org,linux.alibaba.com,wp.pl,goodmis.org,alpha.franken.de,linutronix.de,users.sourceforge.jp,marvell.com,alsa-project.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,amd.com,lists.ozlabs.org,broadcom.com,alu.unizg.hr,rasmusvillemoes.dk,linaro.org,acm.org,omp.ru];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]

On Tue 05-12-23 21:22:59, Yury Norov wrote:
> On Mon, Dec 04, 2023 at 07:51:01PM +0100, Jan Kara wrote:
> > > This series is a result of discussion [1]. All find_bit() functions imply
> > > exclusive access to the bitmaps. However, KCSAN reports quite a number
> > > of warnings related to find_bit() API. Some of them are not pointing
> > > to real bugs because in many situations people intentionally allow
> > > concurrent bitmap operations.
> > > 
> > > If so, find_bit() can be annotated such that KCSAN will ignore it:
> > > 
> > >         bit = data_race(find_first_bit(bitmap, nbits));
> > 
> > No, this is not a correct thing to do. If concurrent bitmap changes can
> > happen, find_first_bit() as it is currently implemented isn't ever a safe
> > choice because it can call __ffs(0) which is dangerous as you properly note
> > above. I proposed adding READ_ONCE() into find_first_bit() / find_next_bit()
> > implementation to fix this issue but you disliked that. So other option we
> > have is adding find_first_bit() and find_next_bit() variants that take
> > volatile 'addr' and we have to use these in code like xas_find_chunk()
> > which cannot be converted to your new helpers.
> 
> Here is some examples when concurrent operations with plain find_bit()
> are acceptable:
> 
>  - two threads running find_*_bit(): safe wrt ffs(0) and returns correct
>    value, because underlying bitmap is unchanged;
>  - find_next_bit() in parallel with set or clear_bit(), when modifying
>    a bit prior to the start bit to search: safe and correct;
>  - find_first_bit() in parallel with set_bit(): safe, but may return wrong
>    bit number;
>  - find_first_zero_bit() in parallel with clear_bit(): same as above.
> 
> In last 2 cases find_bit() may not return a correct bit number, but
> it may be OK if caller requires any (not exactly first) set or clear
> bit, correspondingly.
> 
> In such cases, KCSAN may be safely silenced.

True - but these are special cases. In particular the case in xas_find_chunk()
is not any of these special cases. It is using find_next_bit() which is can
be racing with clear_bit(). So what are your plans for such usecase?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

