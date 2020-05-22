Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF641DEE7E
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 19:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730806AbgEVRpF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 13:45:05 -0400
Received: from mout.gmx.net ([212.227.15.15]:56431 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726373AbgEVRpE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 13:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1590169391;
        bh=7erRvSoNhA31wmPB9BbJ7P0hKnwItvhoaIS4kuMC6eU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=Hjb4bMhdlR7sHNtV5d99R1eTX76MUX6R8s19tj8FxXmSqZm7UWLO3ZUNpjUo7IH2o
         h3bW8Xfb9O/dq0ewfIpoSfoDR+iULVdTEEaTuQpdOJgDNJ6zlv1k1v82zqJHSwKDCf
         aEtdaMHfhJenrWaYH8+6zqeH1tUdh9Y8OTnWl+/c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ubuntu ([83.52.229.196]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MEUzA-1jnmHF0YFG-00G09d; Fri, 22
 May 2020 19:43:11 +0200
Date:   Fri, 22 May 2020 19:43:08 +0200
From:   Oscar Carter <oscar.carter@gmx.com>
To:     Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc:     Oscar Carter <oscar.carter@gmx.com>,
        Kees Cook <keescook@chromium.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        kernel-hardening@lists.openwall.com,
        linux1394-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        alsa-devel@alsa-project.org,
        "Lev R . Oshvang ." <levonshe@gmail.com>
Subject: Re: [PATCH v2] firewire: Remove function callback casts
Message-ID: <20200522174308.GB3059@ubuntu>
References: <20200519173425.4724-1-oscar.carter@gmx.com>
 <20200520061624.GA25690@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520061624.GA25690@workstation>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:jDAMWBN6i5llv7LuCYMCYADueBSFhw0jntdkKB6FtXgQAyx1hJ0
 UK/B3pkqK3wWld06+HtcL3GkrxXPNbPMNAqzx2IiY12Voy7K4SX+svFljoBoq5qXh/T7Rig
 z25dmI8qQlmwS63YSWgzLAI0IC/I/rDgLrfpj7LYiKY5vHVkg4mYH0yBuPPN1gBnQLtb+F/
 AguVGShVfnafJ5CncWSSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GoeMsB1jtDE=:f9abdmhLj0xQdohvGCIalV
 RRr72hC0sw4q03hwh9q6iZsJqgjZL+erf6n/hPv891ZNZ0EmrMajxwVeV1piFHMEQ1PNxe9ZO
 R0CO+94Jkk6VaWfPzxD9WWVfMD1U4o4Q60bshu6W94Eb+DpNjgwzqbt8XaiXgu4xF/kxgi6AD
 jTnjNbZ/5YXPsL+VKZk7f1eEjyeJ49Vml8+aKYzKc+M+z1hMOIQFbTZcDK+2E0UPmx6rT7A5V
 6DxS0MTInOhwCEMAldomHIUzDTGkCVGqLc7uqYH0u/t6ctXaoMXNdKVGyjKqDbjcHkYwdoenv
 7Rlz1ho0CewPY8rdpdsRPCVNzQ3yAk63kjdEmJTlvK76723QOu8KuVG9KSjL85dCi0y1i0Up6
 mfUX8KdAyBqk3hf8STiJ6E9lf5bbWiGgN8BYDG3QvaaMi2YVbNqjbG/NgU2HZBBuo+2JZXKk/
 /RO6puoh0Woykd4I2glBIzHgoAn4Lm8BDBi1OY5/Chx1sKBTxYAqtmFW7KmNyq9zg7QSAKSze
 Lzdw+ZUtuDWpZgNWftZur8yIMd24KzXcT5VM26Vq4dwIFzYkbhyvr1d2Ui2z/8b4bV8rohOfW
 32F+csIz3oVjEsS3MF0Qzd7nW6mBKSaQSPJ817BPh8aWgtqfx6jt2fbCPTNZR4xHli8rF2Kxc
 4Z8cJSGrGyeUIw1GpWX1isqAVFz9P1kQBAgWPf1gg9o6gEJY01D49F5OJdOWBpOYV0MiRQP+j
 QGddvUqdWnbHx0kBirh/xHbESmUmMoWcnfCWBZF7Yxq89CSxY3NaFO8H/EIdn4wjyK5BMIM/o
 6fFodZTD9HBhh7mJA0xto2tGLlexg1gcOxdERLm9d/idYGQz4D1847at8QQoHSjofFSlTJnIo
 TGv4kc770h463ljQXj5ail7euijbHEgqol3fyuxrS5r5ss4S8qDIgxVF0pjjKXvWauJ02QfFj
 m/9N/VKLX+uuZfnzAcDwFI0KxrH/Wf8m3KGiO16g5Jt+5tnbkKagWmBFtzL+s7fSGlC/bNXMx
 FfaAaWscHhBfqIf7OKdh4iagaUAftDCCttPxJuTLv7kgQsiN3VcrhMVZw+WWDVgo0bxORmirk
 Y0VTuutuRLEuSNhnNz0XNqyeNiKTtJ+lptB3svnF70r/OsHJYeypP3rd69hSDygUEhgAHpjVX
 K8/xowWz3py24xUVPm8BaobxgIuMgGrnIOw1/BGo/XnGZ4MM2390yOLpjMIepLDJ1bccAq4uj
 eatIuI5MNkUo7Kj9P
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, May 20, 2020 at 03:16:24PM +0900, Takashi Sakamoto wrote:
> Hi,
>
> I'm an author of ALSA firewire stack and thanks for the patch. I agree w=
ith
> your intention to remove the cast of function callback toward CFI build.
>
> Practically, the isochronous context with FW_ISO_CONTEXT_RECEIVE_MULTICH=
ANNEL
> is never used by in-kernel drivers. Here, I propose to leave current
> kernel API (fw_iso_context_create() with fw_iso_callback_t) as is.
> Alternatively, a new kernel API for the context (e.g.
> fw_iso_mc_context_create() with fw_iso_mc_callback_t). This idea leaves
> current drivers as is and the change is done inner firewire-core driver,
> therefore existent kernel API is not changed.
>
It sounds good to me.

> Later I post two patches for the proposal. I'd like you to review it and
> I'm glad to receive your comments.
>
I will take a look at your proposal. Thanks for your time and work.
>
> Regards
>
> Takashi Sakamoto

Thanks,
Oscar Carter
