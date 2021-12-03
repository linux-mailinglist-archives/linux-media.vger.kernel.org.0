Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94AA5467438
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 10:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351548AbhLCJrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 04:47:09 -0500
Received: from mout.gmx.net ([212.227.15.15]:46877 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242976AbhLCJrJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Dec 2021 04:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638524624;
        bh=FjKExa76ozvVRIDLYJk+r4KJYyZ+SL5HkthLbOqQE6E=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WpX0NaI5QMRykdqsz6iOn6zgo/4GzhP0ezG3mkJcIslNPtb/opO9fYBHZeliMt5Jk
         T2N9aOdwR2aSLnmHo01bfttgv1Dkeokg0FqNEZezOltVSVB/snEgcKPA6Y84AGWgs1
         ztvOSAGjKUuFAeNm5aBJ4fCkDuCYVDz1oJHehsZU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bs49.server.lan [172.19.170.102]) (via HTTP); Fri, 3 Dec 2021
 10:43:43 +0100
MIME-Version: 1.0
Message-ID: <trinity-10035eaf-27d8-484e-b722-c2fbcf4d9215-1638524623919@3c-app-gmx-bs49>
From:   Robert Schlabbach <Robert.Schlabbach@gmx.net>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     linux-media@vger.kernel.org
Subject: Aw: ovm6211 linux driver
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 3 Dec 2021 10:43:43 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <YanepzHYQMH/DfHY@karbon.home.net>
References: <YanepzHYQMH/DfHY@karbon.home.net>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:k2pBxWZRR97py4AVQCHb1a7xZKCkOLZFsUPTozieNdfFE6bFwL4HWKH+SxcqMDos+Zblu
 jz9xBjEn3np6AnlYbJufcvqz7Mb7i1/5Vwp7dnX/JgLwzL8N0Goo7532I+GSHMtaVBhaYxSjV5e1
 hp+2b54VXncZTRhLKnbKdM5RGdTyApY6Prtf6qnz5zc/3kXCxPHFDATjcgsmHLrBVjFxwuXUTNCB
 f4HU5sYl/BiaftzKVNvQlnjrZNkvl0ymsfaoaUnEguCdW52AT/dM789ZFHusIVGATY00PxjyfLqJ
 WM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UekAcMwU5VE=:3FbQylf5vc+385K+tA6pr3
 U1h2Kl6cTIPpa0+vXjrYMXet9k8MUCqcS3tL5afUoC6Ui+Tt3OqR9z7CxuvLYb/6liY6j4E/P
 4LCP3FC4lZO05dc/gkR42J8GnuPWN1zzWG6zryylq9o1ECpot7xUoSwykcpwBwzgUer4aXadX
 wJQCJ7/XtkdXyBTynm/YyRNRNixrNFzCcFmjo1qoM7McQgeF9v8A13nbqG+gtfB8E675+qHqk
 0MX2A+lzOlcdmYQA/GUKAQVXqrRIvzgKVohopgzCVsxZsM7FSgCZt6vtQ4LCBtgYNlM/xUBir
 yWSC4x9V826LYZ2nKkcuWPZqE6Mj/IoKRrMFTqdsiFoOjzBwRdc2oWwzj9AIJ6VVD8cxoHFIW
 8fX0/ZHoxACJLA0p6geVS5LUoyZpYEkY1BPv6Kh6Nzv4fM6JrhQwgapFnXOPRf/xxGXOfRY1V
 qAD9wgcE9t89RdECsEkUWWtcCWE0TqcqWvyIdWOD1EbKxIQjpRcdb83+vB0LhvZgQJhC9Ak86
 g2EGbRShwzee8yYz7NTAsizdt6u4dz0soTLtB5vC8ce2uDMoIORdIqwscEKH96va0k+EOSddO
 uyZs1yTtUimYQP1zI6SlozAAlHz6sv+jcp21P/Cad1co3HoUkUORbam6A3rfa13L5vxtS02Oa
 d4WaUzCN+ZXR07llejPTtTGrtp+tX+2AkRo/MTJHOMb0romsQ7Q0lchmfwYBDi0bbza3gaSMH
 gmwXceTsCNT3ICvoHZxaMyNkOohLTMrAQqugijcWbXF9CrjGcsmQpa7ewIeWV1ihTh7+JiRQr
 5wFgqiH
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From:=C2=A0"Petko Manolov" <petko=2Emanolov@konsulko=2Ecom>
> On request by certain company we've developed a media driver for OmniVis=
ion's
> ovm6211 camera sensor=2E We just got permission to mainline the code=2E =
How shall
> i proceed?

Hi Petko, the Linux kernel documentation has all the information you need:

https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/stable/linux=2Egit/tre=
e/Documentation/process/submitting-patches=2Erst

Best Regards,
-Robert
