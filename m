Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCC12DF633
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 18:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgLTQ74 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 11:59:56 -0500
Received: from mout.gmx.net ([212.227.17.22]:41673 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727396AbgLTQ74 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 11:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608483505;
        bh=DC8wVKNPaPRsco1RmHQ6aJvsGHfVQ48+LIfds7xjntU=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=abD9qr9RQoBIZxCH4yJI9V6uRykmST58TFE3kmyq2sUnPYx/+8P9aJF61RuNhpe+j
         3BUSd/MQ7NaBuYR+eVdOnoRClODZNAhFZcaqABjZ3iUxGHSx9QpfuMXaINvIpRGMaj
         spVXcp2vVWWAt17S+6NVTxZSTwH2oh0vJRJLF8w4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [2.206.181.82] ([2.206.181.82]) by web-mail.gmx.net
 (3c-app-gmx-bap54.server.lan [172.19.172.124]) (via HTTP); Sun, 20 Dec 2020
 17:58:24 +0100
MIME-Version: 1.0
Message-ID: <trinity-3f9b91b4-9d40-4a88-ad57-daeb25d2fc4b-1608483504874@3c-app-gmx-bap54>
From:   Daniel Speckenheuer <daniel.speckenheuer@gmx.de>
To:     linux-media@vger.kernel.org
Subject: Logitech C922 Pro HD Stream Webcam
Content-Type: text/plain; charset=UTF-8
Date:   Sun, 20 Dec 2020 17:58:24 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:TE4YMKvjczCh3IvlHGXZIhRT3n4sVnw7kTK84Sii4kqo6HjCJtH0F/B3rnfmCuqEAhGxz
 Jiy8kNWBi4flF0B/qGZxPQyPkWHFrEQcsuCpFVq7acx35sS0RC1hGoUtDMMtMKs2Z+rGnJWwCm+7
 hDy3zVaSagKP4jzM9gwlFi7A39E+6yYRTq7AH5JyOkmzq4Kxwkdmqn1c7rVnnm+2Ku/9rWi5HSwx
 teLuIvKZsJ/2LWvJH4anrexqa8dfhw6+MsxNS67XVLsxUdvq4GrH7TfrPu8q0OYLXjrawZG6ZJBA
 pk=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NkJELWA9+WM=:ntIoeNVHaMLJflUuA4Rg+f
 26GFA1c/jeklrNjPq31xQFNAISjdIv2X/o+wQ/c1ou494YQ9Ylo7EZEonL5qw8BvGcAC+aM1R
 JOituCYQAsa1QlNBlHRLaSmb0sTLkUvehhaIh/scDlHBqQeCHsiXwMWF7wUGJ/FTxKoIfLxvF
 CuBz8f9Wc5AEVXrabAcOM0MFPRG0UmfqqMFcyrgT7RGrqiHLe+fqpEXMYgNP+3oCdHIsreXMl
 6wVVWR/Lmo3OZSYYPrXgL/UO5BNZfS7xH9z59GXcWTXI6Bp1xRnw3cHwfNDtR5fnfzzVa7WXC
 IclelQGYxiusMPAjAbJhyEtmbQnHSBCx/I1+3cmwYmAGsEHKfQTaaZpZh+TjRkS2ofybG77PJ
 Z7V7wGb1Apgvb0Dl0cuZTf8Xnwlw4yr/8NnWSJuLoMohpK0TCHeBGTb5wpTudzsULf/moIcbV
 4cl1Z8ICxHYOisUpJunBs0OCbb8BKWqCysu4Ar7pyJ86XYSSDpsMW6/5g7mfXZr1zlRQjnbMC
 rEAxAJ1tOohvfPZG9A4816dpQpsZoCesRmihDE76NCEoJOIp0aJbHvUgQqDg52ZCkFW3P3+SG
 21FGE/d6E0r4BQWb69Wr0c3X2Z7cPq7LFX
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,


the current C922 model from Logitech is missing from the table of known UVC devices.

Please complete the model and let me know whether this works without problems under Linux or whether problems are to be expected here.


Thank you and best regards from Germany!

Daniel Speckenheuer
