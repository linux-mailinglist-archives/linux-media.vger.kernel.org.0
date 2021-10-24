Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBF3438889
	for <lists+linux-media@lfdr.de>; Sun, 24 Oct 2021 13:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhJXLTH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Oct 2021 07:19:07 -0400
Received: from sonic305-19.consmr.mail.ir2.yahoo.com ([77.238.177.81]:36091
        "EHLO sonic305-19.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230249AbhJXLTF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Oct 2021 07:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048; t=1635074204; bh=58hNjxmNoVwulI4sHiOijedVlURee+3gaHjRKrISsvo=; h=To:From:Subject:Date:References:From:Subject:Reply-To; b=VLu/zfGOIkTOLvxfWQV+bVV6yWxU1VqCTpL5rsLI36f2S996nlKt14sSFermA8FC02UwiMsaUlR3QgK/cGR3QdpLJRzM3kDE0xBRZ9axNSRZa0xCR0ONIqP0oI+R94cHrE9UUCAcAM98aKXiJjOphp+y9ts/vr1qddyHzruJQ7qgU2yl3f+cD5rvdSccNCp+DitI74mTm+/7b/dQXVGYMFHJf/gzBjbTICSyRGZop3mfsWl57qD4/zeY84oukx8HyVw4ByYyNZcKKXDQom+lLbAh0EKNzqBj4bDO3TShMtgGX+au2KS3CskcP3XFdZLST+YJOp0n47BKF8LfoV88Hw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1635074204; bh=ck3PyTeOJlApoghgNw89fH2jJPMcDZFuqfYuOx4Gugj=; h=X-Sonic-MF:To:From:Subject:Date:From:Subject; b=PJvaqrAH5S+YmfugBRu7SYNkwE+6v2sNELrm+zz9HpYcxdm05pRbl26A9dpWbY6EI2tkjkP/4203+mIACPKkS9eJsvmiVKGv7OM+FJHZaWiJazFyq2w9Jzr6BvdgL5cvgIpTYe6rRCnWzLMtbuuLeR3VNxcp1Azgavb9bnQkzBwcTaz+74hyT8DMoj99kKpjai8z5rjbvqC0UqKjrx/5dM5+QkXyIJXHXohvWd+aeMbpfqiQdt60X+mnHMM4dD3ylKRj3hjfyOjLbk2ekwnfshoG+wdSEr9xZChz9V3QQeP/kn27RwkfWnJsHOUlYAmpe98xHFuGNm7NAxaRUJZUfQ==
X-YMail-OSG: MU1IEtkVM1m6KGzHCx8UqtERMAUVM5eLUygpnB2JSnmpB258xrt_3XacyIdrMd6
 tPD9IOKM5BngYeqzOfBvAlhm1OZde19wkSdSVYRLxC1EzN_qGvbcCD_xkGlm1a.NK_AHoboTIUA5
 INZuP7AgwOuoo8zCKHyXN46CHpKDle9uCDQ0_Twgmp5FzSwkCHnHCfEltviOgSiurPr3ZS55sIM.
 eNBll2CipAfzsA.ahRQxk8ZEz1NdJuI8KXq6MwmZkTwb_Kcm.W.CuhkIMnWPHo8t4BnipGyrFKVc
 liLuO3m4_Py20dh0mjKp97aR8idrw8HelTNIqrf1mQNbE.JPtrvZ54FO0T3V9IRMohYRJX9g_40k
 mUjUOPkijTYwxfBz7x.L0EMTtn19iF04CIHk2AY8IWNN2HFPTkpuY6bXk5nZotpl9HkuttnObtNL
 i3HhMDW9R.W9kACHY7VFAFVxz8zqADhCqJ0hWyYYv8x..y3OQ3ipMq2cYHhtgTEAfBWLsb01V740
 xkvmURlOQ5fLtKCI_g_EE8oNHMkKDzrdqsIqKUHyJwf3zpUXcZzDdI1xB5BTnNph.bdlOs44X6Tq
 ZWWNk_ywcNrO0G86PVV_Yp192MoqBIVnhzIt59SnHbRqt30HTKmpfmqgFKaD6Xm3K2zWGY02eWiu
 S3.V8bRsQbD7a6ZUrcN2sTSY2.JZdtbJ8U1K.YKj53YY3j.kaxV3zSEEmXA8iMoNV4r1LS7Eqego
 Z3KX8zuQzLmiBwI0mZvL86tRafsqA_IYemeugsK9Pg3Iy4htgvF2b4hCXhQukDpGw53sMRk03k6x
 jrIf5cdkA8VAqifukr8ArlMBbGl.B6xU0JPpytKvljcYb7Oek7Fo8YJAEPPFpzBIxOtLdLzWosxx
 zOMUObvb3QIaBKTRanahMSbIPj7K5a33UlO3EeMH1CYav5XC9.f2Fcs1HJdeu2Nc2TZ_4XnVmHyf
 W00do1r9vNrdJJ2NDOxQUd3U.njwU6hlpznZF8C4hmyost0M.FG__yGxumNGyAwWHNOCZBL7Nqdf
 RSp7u5YiCD.CclVRO94V22rFI_WWM7pGUKMDIae0yDFt5TrkpwSDEBHrEwtHBYutzm9XJyvUL2MG
 W.1JTR.KqQOQ6TgwHqidh40Bert5MNXJSHj82szgN8eoW1Y1fbDKw19KfYX0fpKOSic7aM5vYjE7
 bkoM1rv3TujprQZ_I4xRBPBeAik8BO3OssRwAS8nc8gS.y5E23Nk1fmJWQ9s9JRHFP9d4QuNOVnH
 2LPph6BAYMM7oH1GgP.l6kU4ocHGzv5EyI4omNkFthH3D6SqflMnWcYc1YsURc3wxksLhgre6fMn
 KBDlJYojm46u6Eru6WUpvY4yX4LxziGtUkYM5_2PnDnz0fz8iwt5Lt3ZTQKsFMZBX0JOlavyOLzp
 CM0UMVJNng5ST2tAi5cAb80SgK7ySf_AltnsDazdSQ3Bj_p7Dmnwal5rOaf96Oi7jO6yLxjSnnjz
 7d6ngEU3UvO7TgEdL2M_fcdu.aQ0BYU1Lh5n7XUjlciwqZdDrzCkn1yBcQAMNgiwAY0PADie8Ngn
 _Jenay8XLiZF011Wy0dIOC09tePF.1YWkQVh_Hyvd76jjlntisXtW6jfR.4MMdknLa4dooOZDa8R
 K5xL0uJ2myeVb.KI83fZJxs1KwbCUO15B_NSaRxF0SjKyQurQR7nViq6kXvb.S0RMih34QNgiQZs
 BsdZ0KkP7mAwd442IheWK4Yq011cb7336ucq00GDGlyZp8hjvW9KYZf_lhhpOvVImdz.RFJubegN
 IYQvRWLJe_5.s3Qv91W2ayz9R7h0eBKFZhb5pp_zNj3AcUhI4kZAcNhDxDGumnQfMerJHX3VSAjK
 9_37qSK2CyVigIjgYwnMOmykgU5feos77T2mNuGANA3j6dNZCvG_VjtxuiigibmgrMUnVhytv4wM
 gegI35hm0D30rvERnQUuvIB8lftez6Bu7KuqMJdSHFUnc51ysK1PpbcN4KRi0cuF825NxUSAJSRj
 QwTh5s4hX8sX9gQlYrwhPD8GQnHJAiDWWKveWKckeH1FM5w.wrg3ZRLiPMZXIAopWY3POmOivtkz
 zDUMSOZiv1yd0Goz5DBzKDBBhPjBsdw17j8IiFaUY7sKdiuR06Wazz14t1A2YeTucr16kH.nvERT
 799OPZhuw0KzDeIvaZqc36mUY9H1g6_TRC93L10HMn3wP0i4CcoLqrZyxL.ZyQ.vOilXmalMSEOD
 RqowEFLQXFeKiKR965r0u6H8RPPY2krsL5t0vvXJXKwK0QW0XapkommwC8aJbpqSYJ6cZPDOupiC
 _053rLA9Bnp4FgvfUv57gDDuT
X-Sonic-MF: <kochnorman@rocketmail.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ir2.yahoo.com with HTTP; Sun, 24 Oct 2021 11:16:44 +0000
Received: by kubenode521.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 282bb951de3baf8022c0c4e50b533944;
          Sun, 24 Oct 2021 11:16:39 +0000 (UTC)
To:     linux-media@vger.kernel.org
From:   Norman Koch <kochnorman@rocketmail.com>
Subject: Problem with NFS when unplugging laptop from docking station
Message-ID: <cf7d0c4c-e8b4-2611-8dfe-58fe6d74a813@rocketmail.com>
Date:   Sun, 24 Oct 2021 13:16:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE
References: <cf7d0c4c-e8b4-2611-8dfe-58fe6d74a813.ref@rocketmail.com>
X-Mailer: WebService/1.1.19198 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I'm not sure if I'm correct to ask this here, sorry if it's not.

I use Debian 11 with 5.10.0-8-amd64 #1 SMP Debian 5.10.46-4 (2021-08-03)
x86_64 GNU/Linux as Kernel on a ThinkPad T440. I also have a network
attached storage device which I access over nfs. I load it via

//192.168.0.103/fileserver /home/norman/fileserver cifs
auto,rw,rsize=3D32768,wsize=3D32768,uid=3D1000,gid=3D1000,defaults,iochar=
set=3Dutf8,username=3D<HERECOMESMYUSERNAME>,password=3D<HERECOMESMYPASSWO=
RD>,vers=3D1.0
0 0

in my fstab. It all works fine if I start using it while I am at my
docking station (with LAN-cable to my router and IP 192.168.0.109), but
it fails to access (and even re-mount and umount, when not using umount
-a -t cifs -l) on wifi (having 192.168.0.102 there). But when I umount
before unplugging, and then unplug and re-mout, it works just fine.

When I am in the situations that it doesn't work, all windows keep stuck
and I cannot interact with them anymore, if have anything at all to do
with my NAS (even ls ~, because it's mounted in ~).

I am not a kernel programmer, so I cannot look into the source code to
tell why this happens, but I can speculate. I believe the NFS-driver is
somehow linked to the interface it was first connected on. So that, if
you connect on enp0s25 first, then plug it out, and try to access the
same host (the NAS) when enp0s25 is down, it fails to do something, and
there seems to be no timeout set by default that prevents the system
from crashing. So in short: use the IP so long as it works, but if it
doesn't, use the MAC-address to arp-scan the network, maybe you're on a
different port now.

Is this reasonable?

If this is the wrong mailing list, I'm very sorry. I'd like to be
corrected on where to send this to be dealt this properly.

Thanks,

Norman


