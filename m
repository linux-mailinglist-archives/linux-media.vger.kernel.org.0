Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DF51C6981
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 08:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgEFG4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 02:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726451AbgEFG4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 02:56:33 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C901EC061A0F;
        Tue,  5 May 2020 23:56:32 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id b6so884173qkh.11;
        Tue, 05 May 2020 23:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=g4mEA7psFAWfP/DWFOVbhOa2yXPpZxwLT+x2aAr3dAA=;
        b=pivKrwZ/HTtBb+GDV6/M/JoLtcHXR0gIYHTZ4/6TZM5xpSQGxykyVkZDVz8bDymHkV
         lcgbRo+8zU/CC4AVratnDce6eRa9D0L+xgZEUlBm/0cBd0P7qRx7JFBLTMProGfnTDdg
         8bz7f/Ui6q590m1nF2UFuVF2ATuIRhqeYB9VOhq55RFTI3iEcgVGacuaje9KBRBwAp1o
         oxYX66Ru10kQXCcPvp7aQ1BRMeYu+bfDrJqwxCu1yDw2X3FW1uJyk8sOweamUxRXaiq9
         iIStVtBR/7HlURHAgeetpcnALl44ntx00aVB55g7s05Oc9epBwlbox7Ofn1xhBg/Kix4
         O5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=g4mEA7psFAWfP/DWFOVbhOa2yXPpZxwLT+x2aAr3dAA=;
        b=e/Vi0zbsfJr9rXTS45y1pAn+B21AAvWzYRGdXSlFDidRTffGvLYiaORHLh7jdDiVs/
         E7JRa1Q5i14cTUWD6p5LZGTjF7wL9fDh25fOJYhQfUp02lMA+6kHC5VSWB6qQlsE2k9g
         OwkDBGZgn9v3OqFBw9ZICwJwSofXemazFD532bLl9KMMQJNtipFbC4XipyHjEcWdEg+V
         LRL70kVmR8/KeHc8Aj7G0HGzsFai9unt76Sug8kqrjdNXJzFIZNGhzOEMpUXwdVRBc1e
         D2c1fVk+czmunx6BClUVzgJ8IrY/4R/gfLtemiKXmsj1ErMiwIhvYfSWQ172T7DUPEw4
         CLqA==
X-Gm-Message-State: AGi0Pubn2d0OSJUo6ZlwwMN03OCQCVzNmYRIy4BASlC0uUbjXPhuZ9ly
        x7GroCboWPaw/tjcGYse/Ii0naWt91g=
X-Google-Smtp-Source: APiQypKlfwOaA5T0mzX83+5/WFryXYBnpEehLpnP7Em4tqgoXyObmhQrRr9uzeaiU2/q/09o0gFtTw==
X-Received: by 2002:a05:620a:65a:: with SMTP id a26mr6952049qka.323.1588748191584;
        Tue, 05 May 2020 23:56:31 -0700 (PDT)
Received: from dwls-dell ([177.193.195.148])
        by smtp.gmail.com with ESMTPSA id b19sm1018449qkg.72.2020.05.05.23.56.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2020 23:56:31 -0700 (PDT)
Date:   Wed, 6 May 2020 03:55:48 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     "=?utf-8?Q?sean=40mess.org?=" <sean@mess.org>,
        "=?utf-8?Q?kstewart=40linuxfoundation.org?=" 
        <kstewart@linuxfoundation.org>,
        "=?utf-8?Q?allison=40lohutok.net?=" <allison@lohutok.net>,
        "=?utf-8?Q?tglx=40linutronix.de?=" <tglx@linutronix.de>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>
Message-ID: <40C2F764-6E43-418B-8904-952C5E99D9D9@getmailspring.com>
In-Reply-To: <20200503101621.50047b5c@coco.lan>
References: <20200503101621.50047b5c@coco.lan>
Subject: Re: [RFC, WIP, v4 09/11] media: vidtv: implement a PES
 packetizer
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,


> As commented, don't use WARN_ON(). At most, you could use WARN_ON_ONCE(),
> as otherwise, you may end by causing serious performance issues if
> the code starts to produce a flood of warnings at the dmesg.
> 
> I would use pr_warn_ratelimit() on all such cases.
> 

OK.




> I don't like the idea of changing the "from" buffer endiannes, copy
> and then restore it back to the original state. Is this really needed?
> 
> I would, instead, define:
> 
> 	struct pes_header {
> 	...
> 		__be32 bitfield;
> 		__be16 length;
> 	...
> 	};
> 
> Then wherever you would touch them:
> 
> 	u32 bitfield;
> 	u16 len;
> 
> 	/* Write into BE fields */
> 	pes_header.bitfield = cpu_to_be32(bitfield);
> 	pes_header.length = cpu_to_be16(len);
> 
> 	/* Read from BE fields */
> 	bitfield = be32_to_cpu(pes_header.bitfield);
> 	len = be16_to_cpu(pes_header.length);
> 
> 
> As a side effect, when you use "__be16" and "__be32" types, gcc
> and smatch/sparse will warn you if you mess with endiannes.
> 
> Same applies to similar code elsewhere.
> 

I don't like it either, it is error prone. I did not know about this
other possibility. Does this work for _bitfields_ though?

I think the authors for libdvbv5 used unions precisely so bswap() could
be called on a 'bitfield' member and from then on the bitfields could be
accessed directly, e.g.:

	union {
		u16 bitfield; <-- call bswap() on this
		struct {
                        --> then use these directly:
			u8  syntax:1;
			u8  zero:1;
			u8  one:2;
			u16 section_length:12;
		} __packed;
	} __packed

At least that's what I understood.

I found this: 
https://lwn.net/Articles/741762/

Maybe *_get_bits, *_replace_bits is the equivalent that I should use for bitfields?

Because I'd rather not do this:

> 	u32 bitfield;
> 	/* Write into BE fields */
> 	pes_header.bitfield = cpu_to_be32(bitfield);

Since I'd have to write the (many!) bitwise operations myself and I'm
sure I will mess this up at _some_ point.



thanks,
- Daniel


