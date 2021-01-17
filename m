Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3136C2F9083
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 06:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbhAQFSF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 00:18:05 -0500
Received: from cmta16.telus.net ([209.171.16.89]:51145 "EHLO cmta16.telus.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbhAQFR5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 00:17:57 -0500
X-Greylist: delayed 386 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 Jan 2021 00:17:27 EST
Received: from [192.168.2.104] ([184.75.212.12])
        by cmsmtp with SMTP
        id 10KKlfprM81Rp10KMl7Av7; Sat, 16 Jan 2021 22:10:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telus.net; s=neo;
        t=1610860215; bh=0gAxYG2DJWjoGADDMy30jV/3hl/xJXw4v5oyVw46VKU=;
        h=To:From:Subject:Date;
        b=lII0JMGuLo1/4BXtGBoW42G/jVWNbmUxbaWmcabYWe8h/evaE9LtqVc4cQuip+thR
         HxcQAZnKTgK7dNvr7Q5xxOwrBy89ppX+d6wS+0NwkTHIkGQNzZfkJ/cOtnJ8r8eniY
         1KHE1kjOqtX4tVmQnGQhUKnpAbxzIIDTIxAhrcubWe9MO/mHEEsXmo+LM1DvVLzn5D
         OK2GEDPfF46waccC+AlJg5yMLPAEGr6xW+MRUYaVtd3tPUU94f0RicKz4q5xr+E3a/
         XxzeDSizSE4PooJ4ZqfU8kUyEXupBDQCMBjDghV51Qs4DgW+gKllSugKIjHW49X6Wx
         ON0ofEsd/1nfA==
X-Telus-Authed: cm9id2Vpcg==
X-Authority-Analysis: v=2.4 cv=GuOHRm5C c=1 sm=1 tr=0 ts=6003c6b7
 a=JBLdEUUkkOODsr3PlpQXwg==:117 a=JBLdEUUkkOODsr3PlpQXwg==:17
 a=r77TgQKjGQsHNAKrUKIA:9 a=kqFlEAFvXmDhPCHxxcgA:9 a=QEXdDO2ut3YA:10
 a=IZJYoj4pmrZCFf2BdMkA:9 a=7HcTNBtph9BO65dN:21 a=ITdVHhY7-e0A:10
 a=9eQo0AdBp24nOSruh_oA:9
To:     linux-media@vger.kernel.org
From:   Robert <robweir@telus.net>
Subject: Video Device Not Working
Message-ID: <c7673384-d453-e325-4596-b31fd4462b90@telus.net>
Date:   Sat, 16 Jan 2021 21:10:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------E930507D46929090046225F1"
Content-Language: en-US
X-CMAE-Envelope: MS4xfGj2YPeRQ0hnSVf/pBPpqFXSe6dbL/0tEqV6mEfOUh/8V5iJsq1mDTL8gD7c5AaR0sMaaD4H1PKu5dw8D1/U8ItZ60qn9iCR/F96zfDKl5rh3hrc072r
 Aq2E12oIxXk6d2rLaabWv6+COeBXhuU3PTladBZHbpqKx/WQWLKvoHPkT8zSuY2DSkKtyFC056jq3C9hO8aZHTipteaFFuAJ1uk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------E930507D46929090046225F1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi
   I am sending this Email because I cannot get my WebCam working on my 
Laptop.  I cannot see it in your list of VID:PIDs (04f2:b604).  I have 
attached two log files that were suggested in your FAQ.  It will not 
work with 'Cheese' nor 'guvcview'.  Log files are 'dmesg.log' and 
'lsusb.log' respectively.
   My Laptop is a Lenovo L340-15API Model Name: 81LW.  I am running 
Fedora 33 and it is up to date.  Any assistance would be greatly 
appreciated.
Robert

--------------E930507D46929090046225F1
Content-Type: text/x-log; charset=UTF-8;
 name="dmesg.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmesg.log"

[10446.733671] uvcvideo: Dropping payload (out of sync).
[10446.733676] uvcvideo: Dropping payload (out of sync).
[10446.733681] uvcvideo: Dropping payload (out of sync).
[10446.733685] uvcvideo: Dropping payload (out of sync).
[10446.733688] uvcvideo: Dropping payload (out of sync).
[10446.733696] uvcvideo: Dropping payload (out of sync).
[10446.733701] uvcvideo: Dropping payload (out of sync).
[10446.733706] uvcvideo: Dropping payload (out of sync).
[10446.733709] uvcvideo: Dropping payload (out of sync).
[10446.733713] uvcvideo: Dropping payload (out of sync).
[10446.733845] uvcvideo: uvc_v4l2_poll
[10446.737434] uvcvideo: Dropping payload (out of sync).
[10446.737443] uvcvideo: Dropping payload (out of sync).
[10446.737448] uvcvideo: Dropping payload (out of sync).
[10446.737456] uvcvideo: Dropping payload (out of sync).
[10446.737460] uvcvideo: Dropping payload (out of sync).
[10446.737463] uvcvideo: Dropping payload (out of sync).
[10446.737468] uvcvideo: Dropping payload (out of sync).
[10446.737473] uvcvideo: Dropping payload (out of sync).
[10446.737478] uvcvideo: Dropping payload (out of sync).
[10446.737482] uvcvideo: Dropping payload (out of sync).
[10446.737487] uvcvideo: Dropping payload (out of sync).
[10446.737495] uvcvideo: Dropping payload (out of sync).
[10446.737499] uvcvideo: Dropping payload (out of sync).
[10446.737641] uvcvideo: Dropping payload (out of sync).
[10446.737644] uvcvideo: Dropping payload (out of sync).
[10446.737648] uvcvideo: Dropping payload (out of sync).
[10446.737651] uvcvideo: Dropping payload (out of sync).
[10446.737655] uvcvideo: Dropping payload (out of sync).
[10446.737819] uvcvideo: Dropping payload (out of sync).
[10446.737824] uvcvideo: Dropping payload (out of sync).
[10446.737830] uvcvideo: Dropping payload (out of sync).
[10446.737835] uvcvideo: Dropping payload (out of sync).
[10446.737839] uvcvideo: Dropping payload (out of sync).
[10446.737844] uvcvideo: Dropping payload (out of sync).
[10446.737848] uvcvideo: Dropping payload (out of sync).
[10446.737852] uvcvideo: Dropping payload (out of sync).
[10446.737857] uvcvideo: Dropping payload (out of sync).
[10446.737865] uvcvideo: Dropping payload (out of sync).
[10446.737868] uvcvideo: Dropping payload (out of sync).
[10446.737873] uvcvideo: Dropping payload (out of sync).
[10446.737878] uvcvideo: Dropping payload (out of sync).
[10446.737886] uvcvideo: Dropping payload (out of sync).
[10446.738291] uvcvideo: uvc_v4l2_poll
[10446.741456] uvcvideo: Dropping payload (out of sync).
[10446.741462] uvcvideo: frame 205616 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 326226289/326734533/1243
[10446.765358] uvcvideo: Frame complete (EOF found).
[10446.765367] uvcvideo: Dropping payload (out of sync).
[10446.765372] uvcvideo: Dropping payload (out of sync).
[10446.765376] uvcvideo: Dropping payload (out of sync).
[10446.765382] uvcvideo: Dropping payload (out of sync).
[10446.765515] uvcvideo: Dropping payload (out of sync).
[10446.765523] uvcvideo: Dropping payload (out of sync).
[10446.765528] uvcvideo: Dropping payload (out of sync).
[10446.765533] uvcvideo: Dropping payload (out of sync).
[10446.765668] uvcvideo: uvc_v4l2_poll
[10446.769350] uvcvideo: Dropping payload (out of sync).
[10446.769358] uvcvideo: Dropping payload (out of sync).
[10446.769362] uvcvideo: Dropping payload (out of sync).
[10446.769539] uvcvideo: Dropping payload (out of sync).
[10446.769543] uvcvideo: Dropping payload (out of sync).
[10446.769546] uvcvideo: Dropping payload (out of sync).
[10446.769550] uvcvideo: Dropping payload (out of sync).
[10446.769553] uvcvideo: Dropping payload (out of sync).
[10446.769558] uvcvideo: Dropping payload (out of sync).
[10446.769729] uvcvideo: Dropping payload (out of sync).
[10446.769734] uvcvideo: Dropping payload (out of sync).
[10446.769742] uvcvideo: Dropping payload (out of sync).
[10446.769746] uvcvideo: Dropping payload (out of sync).
[10446.769752] uvcvideo: Dropping payload (out of sync).
[10446.769757] uvcvideo: Dropping payload (out of sync).
[10446.769764] uvcvideo: Dropping payload (out of sync).
[10446.769768] uvcvideo: Dropping payload (out of sync).
[10446.769773] uvcvideo: Dropping payload (out of sync).
[10446.769777] uvcvideo: Dropping payload (out of sync).
[10446.769805] uvcvideo: Dropping payload (out of sync).
[10446.769809] uvcvideo: Dropping payload (out of sync).
[10446.769813] uvcvideo: Dropping payload (out of sync).
[10446.769818] uvcvideo: Dropping payload (out of sync).
[10446.769823] uvcvideo: Dropping payload (out of sync).
[10446.769828] uvcvideo: Dropping payload (out of sync).
[10446.769833] uvcvideo: Dropping payload (out of sync).
[10446.769836] uvcvideo: Dropping payload (out of sync).
[10446.769995] uvcvideo: Dropping payload (out of sync).
[10446.770001] uvcvideo: uvc_v4l2_poll
[10446.770001] uvcvideo: Dropping payload (out of sync).
[10446.770003] uvcvideo: Dropping payload (out of sync).
[10446.770006] uvcvideo: Dropping payload (out of sync).
[10446.770009] uvcvideo: Dropping payload (out of sync).
[10446.773550] uvcvideo: Dropping payload (out of sync).
[10446.773552] uvcvideo: Dropping payload (out of sync).
[10446.773553] uvcvideo: Dropping payload (out of sync).
[10446.773561] uvcvideo: Dropping payload (out of sync).
[10446.773562] uvcvideo: Dropping payload (out of sync).
[10446.773563] uvcvideo: Dropping payload (out of sync).
[10446.773565] uvcvideo: Dropping payload (out of sync).
[10446.773566] uvcvideo: Dropping payload (out of sync).
[10446.773567] uvcvideo: Dropping payload (out of sync).
[10446.773568] uvcvideo: Dropping payload (out of sync).
[10446.773569] uvcvideo: Dropping payload (out of sync).
[10446.773572] uvcvideo: Dropping payload (out of sync).
[10446.773577] uvcvideo: frame 205617 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 326726713/327235150/1277
[10446.801349] uvcvideo: Frame complete (EOF found).
[10446.801361] uvcvideo: Dropping payload (out of sync).
[10446.801364] uvcvideo: Dropping payload (out of sync).
[10446.801367] uvcvideo: Dropping payload (out of sync).
[10446.801370] uvcvideo: Dropping payload (out of sync).
[10446.801374] uvcvideo: Dropping payload (out of sync).
[10446.801525] uvcvideo: Dropping payload (out of sync).
[10446.801533] uvcvideo: Dropping payload (out of sync).
[10446.801538] uvcvideo: Dropping payload (out of sync).
[10446.801546] uvcvideo: Dropping payload (out of sync).
[10446.801700] uvcvideo: Dropping payload (out of sync).
[10446.801704] uvcvideo: Dropping payload (out of sync).
[10446.801709] uvcvideo: Dropping payload (out of sync).
[10446.801714] uvcvideo: Dropping payload (out of sync).
[10446.801718] uvcvideo: Dropping payload (out of sync).
[10446.801723] uvcvideo: Dropping payload (out of sync).
[10446.801728] uvcvideo: Dropping payload (out of sync).
[10446.801735] uvcvideo: Dropping payload (out of sync).
[10446.801739] uvcvideo: Dropping payload (out of sync).
[10446.801743] uvcvideo: Dropping payload (out of sync).
[10446.801748] uvcvideo: Dropping payload (out of sync).
[10446.801752] uvcvideo: Dropping payload (out of sync).
[10446.801756] uvcvideo: Dropping payload (out of sync).
[10446.801760] uvcvideo: Dropping payload (out of sync).
[10446.801765] uvcvideo: Dropping payload (out of sync).
[10446.801772] uvcvideo: Dropping payload (out of sync).
[10446.801775] uvcvideo: Dropping payload (out of sync).
[10446.801779] uvcvideo: Dropping payload (out of sync).
[10446.801784] uvcvideo: Dropping payload (out of sync).
[10446.801788] uvcvideo: Dropping payload (out of sync).
[10446.801955] uvcvideo: uvc_v4l2_poll
[10446.804778] uvcvideo: uvc_v4l2_poll
[10446.805396] uvcvideo: Dropping payload (out of sync).
[10446.805401] uvcvideo: Dropping payload (out of sync).
[10446.805404] uvcvideo: Dropping payload (out of sync).
[10446.805410] uvcvideo: Dropping payload (out of sync).
[10446.805412] uvcvideo: Dropping payload (out of sync).
[10446.805415] uvcvideo: Dropping payload (out of sync).
[10446.805418] uvcvideo: Dropping payload (out of sync).
[10446.805420] uvcvideo: Dropping payload (out of sync).
[10446.805423] uvcvideo: Dropping payload (out of sync).
[10446.805426] uvcvideo: Dropping payload (out of sync).
[10446.805428] uvcvideo: Dropping payload (out of sync).
[10446.805434] uvcvideo: Dropping payload (out of sync).
[10446.805436] uvcvideo: Dropping payload (out of sync).
[10446.805439] uvcvideo: Dropping payload (out of sync).
[10446.805441] uvcvideo: Dropping payload (out of sync).
[10446.805444] uvcvideo: Dropping payload (out of sync).
[10446.805446] uvcvideo: Dropping payload (out of sync).
[10446.805449] uvcvideo: Dropping payload (out of sync).
[10446.805452] uvcvideo: Dropping payload (out of sync).
[10446.805457] uvcvideo: Dropping payload (out of sync).
[10446.805459] uvcvideo: Dropping payload (out of sync).
[10446.805590] uvcvideo: Dropping payload (out of sync).
[10446.805593] uvcvideo: Dropping payload (out of sync).
[10446.805599] uvcvideo: frame 205618 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 327227137/327735768/1310
[10446.833356] uvcvideo: Frame complete (EOF found).
[10446.833365] uvcvideo: Dropping payload (out of sync).
[10446.833369] uvcvideo: Dropping payload (out of sync).
[10446.833373] uvcvideo: Dropping payload (out of sync).
[10446.833510] uvcvideo: Dropping payload (out of sync).
[10446.833518] uvcvideo: Dropping payload (out of sync).
[10446.833526] uvcvideo: Dropping payload (out of sync).
[10446.833530] uvcvideo: Dropping payload (out of sync).
[10446.833667] uvcvideo: Dropping payload (out of sync).
[10446.833675] uvcvideo: Dropping payload (out of sync).
[10446.833680] uvcvideo: Dropping payload (out of sync).
[10446.833685] uvcvideo: Dropping payload (out of sync).
[10446.833689] uvcvideo: Dropping payload (out of sync).
[10446.833694] uvcvideo: Dropping payload (out of sync).
[10446.833702] uvcvideo: Dropping payload (out of sync).
[10446.833706] uvcvideo: Dropping payload (out of sync).
[10446.833711] uvcvideo: Dropping payload (out of sync).
[10446.833716] uvcvideo: Dropping payload (out of sync).
[10446.833720] uvcvideo: Dropping payload (out of sync).
[10446.833759] uvcvideo: uvc_v4l2_poll
[10446.837355] uvcvideo: Dropping payload (out of sync).
[10446.837360] uvcvideo: Dropping payload (out of sync).
[10446.837364] uvcvideo: Dropping payload (out of sync).
[10446.837501] uvcvideo: Dropping payload (out of sync).
[10446.837509] uvcvideo: Dropping payload (out of sync).
[10446.837514] uvcvideo: Dropping payload (out of sync).
[10446.837518] uvcvideo: Dropping payload (out of sync).
[10446.837522] uvcvideo: Dropping payload (out of sync).
[10446.837526] uvcvideo: Dropping payload (out of sync).
[10446.837530] uvcvideo: Dropping payload (out of sync).
[10446.837533] uvcvideo: Dropping payload (out of sync).
[10446.837540] uvcvideo: Dropping payload (out of sync).
[10446.837544] uvcvideo: Dropping payload (out of sync).
[10446.837548] uvcvideo: Dropping payload (out of sync).
[10446.837553] uvcvideo: Dropping payload (out of sync).
[10446.837556] uvcvideo: Dropping payload (out of sync).
[10446.837560] uvcvideo: Dropping payload (out of sync).
[10446.837565] uvcvideo: Dropping payload (out of sync).
[10446.837736] uvcvideo: Dropping payload (out of sync).
[10446.837741] uvcvideo: Dropping payload (out of sync).
[10446.837744] uvcvideo: Dropping payload (out of sync).
[10446.837748] uvcvideo: Dropping payload (out of sync).
[10446.837752] uvcvideo: Dropping payload (out of sync).
[10446.837904] uvcvideo: Dropping payload (out of sync).
[10446.837910] uvcvideo: Dropping payload (out of sync).
[10446.837913] uvcvideo: Dropping payload (out of sync).
[10446.837920] uvcvideo: Dropping payload (out of sync).
[10446.837929] uvcvideo: Dropping payload (out of sync).
[10446.837934] uvcvideo: Dropping payload (out of sync).
[10446.837940] uvcvideo: Dropping payload (out of sync).
[10446.837945] uvcvideo: Dropping payload (out of sync).
[10446.837950] uvcvideo: Dropping payload (out of sync).
[10446.838155] uvcvideo: uvc_v4l2_poll
[10446.841349] uvcvideo: Dropping payload (out of sync).
[10446.841354] uvcvideo: Dropping payload (out of sync).
[10446.841363] uvcvideo: frame 205619 stats: 0/170/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 327727560/328236385/1343
[10446.865358] uvcvideo: Frame complete (EOF found).
[10446.865367] uvcvideo: Dropping payload (out of sync).
[10446.865370] uvcvideo: Dropping payload (out of sync).
[10446.865375] uvcvideo: Dropping payload (out of sync).
[10446.865508] uvcvideo: Dropping payload (out of sync).
[10446.865516] uvcvideo: Dropping payload (out of sync).
[10446.865521] uvcvideo: Dropping payload (out of sync).
[10446.865525] uvcvideo: Dropping payload (out of sync).
[10446.865661] uvcvideo: uvc_v4l2_poll
[10446.869347] uvcvideo: Dropping payload (out of sync).
[10446.869354] uvcvideo: Dropping payload (out of sync).
[10446.869357] uvcvideo: Dropping payload (out of sync).
[10446.869528] uvcvideo: Dropping payload (out of sync).
[10446.869534] uvcvideo: Dropping payload (out of sync).
[10446.869538] uvcvideo: Dropping payload (out of sync).
[10446.869542] uvcvideo: Dropping payload (out of sync).
[10446.869546] uvcvideo: Dropping payload (out of sync).
[10446.869714] uvcvideo: Dropping payload (out of sync).
[10446.869719] uvcvideo: Dropping payload (out of sync).
[10446.869722] uvcvideo: Dropping payload (out of sync).
[10446.869729] uvcvideo: Dropping payload (out of sync).
[10446.869734] uvcvideo: Dropping payload (out of sync).
[10446.869738] uvcvideo: Dropping payload (out of sync).
[10446.869742] uvcvideo: Dropping payload (out of sync).
[10446.869748] uvcvideo: Dropping payload (out of sync).
[10446.869752] uvcvideo: Dropping payload (out of sync).
[10446.869757] uvcvideo: Dropping payload (out of sync).
[10446.869762] uvcvideo: Dropping payload (out of sync).
[10446.869769] uvcvideo: Dropping payload (out of sync).
[10446.869773] uvcvideo: Dropping payload (out of sync).
[10446.869779] uvcvideo: Dropping payload (out of sync).
[10446.869783] uvcvideo: Dropping payload (out of sync).
[10446.869786] uvcvideo: Dropping payload (out of sync).
[10446.869791] uvcvideo: Dropping payload (out of sync).
[10446.869794] uvcvideo: Dropping payload (out of sync).
[10446.869799] uvcvideo: Dropping payload (out of sync).
[10446.869804] uvcvideo: Dropping payload (out of sync).
[10446.869809] uvcvideo: Dropping payload (out of sync).
[10446.869814] uvcvideo: Dropping payload (out of sync).
[10446.869819] uvcvideo: Dropping payload (out of sync).
[10446.869826] uvcvideo: Dropping payload (out of sync).
[10446.870007] uvcvideo: uvc_v4l2_poll
[10446.873352] uvcvideo: Dropping payload (out of sync).
[10446.873543] uvcvideo: Dropping payload (out of sync).
[10446.873546] uvcvideo: Dropping payload (out of sync).
[10446.873551] uvcvideo: Dropping payload (out of sync).
[10446.873554] uvcvideo: Dropping payload (out of sync).
[10446.873557] uvcvideo: Dropping payload (out of sync).
[10446.873559] uvcvideo: Dropping payload (out of sync).
[10446.873562] uvcvideo: Dropping payload (out of sync).
[10446.873769] uvcvideo: Dropping payload (out of sync).
[10446.873772] uvcvideo: Dropping payload (out of sync).
[10446.873775] uvcvideo: Dropping payload (out of sync).
[10446.873785] uvcvideo: Dropping payload (out of sync).
[10446.873788] uvcvideo: Dropping payload (out of sync).
[10446.873798] uvcvideo: frame 205620 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 328227984/328737003/1377
[10446.901352] uvcvideo: Frame complete (EOF found).
[10446.901362] uvcvideo: Dropping payload (out of sync).
[10446.901366] uvcvideo: Dropping payload (out of sync).
[10446.901369] uvcvideo: Dropping payload (out of sync).
[10446.901373] uvcvideo: Dropping payload (out of sync).
[10446.901503] uvcvideo: Dropping payload (out of sync).
[10446.901512] uvcvideo: Dropping payload (out of sync).
[10446.901517] uvcvideo: Dropping payload (out of sync).
[10446.901524] uvcvideo: Dropping payload (out of sync).
[10446.901663] uvcvideo: Dropping payload (out of sync).
[10446.901667] uvcvideo: Dropping payload (out of sync).
[10446.901672] uvcvideo: Dropping payload (out of sync).
[10446.901676] uvcvideo: Dropping payload (out of sync).
[10446.901680] uvcvideo: Dropping payload (out of sync).
[10446.901685] uvcvideo: Dropping payload (out of sync).
[10446.901690] uvcvideo: Dropping payload (out of sync).
[10446.901696] uvcvideo: Dropping payload (out of sync).
[10446.901702] uvcvideo: Dropping payload (out of sync).
[10446.901706] uvcvideo: Dropping payload (out of sync).
[10446.901711] uvcvideo: Dropping payload (out of sync).
[10446.901716] uvcvideo: Dropping payload (out of sync).
[10446.901720] uvcvideo: Dropping payload (out of sync).
[10446.901725] uvcvideo: Dropping payload (out of sync).
[10446.901858] uvcvideo: Dropping payload (out of sync).
[10446.901868] uvcvideo: Dropping payload (out of sync).
[10446.901873] uvcvideo: Dropping payload (out of sync).
[10446.901877] uvcvideo: Dropping payload (out of sync).
[10446.901881] uvcvideo: Dropping payload (out of sync).
[10446.901890] uvcvideo: Dropping payload (out of sync).
[10446.902031] uvcvideo: uvc_v4l2_poll
[10446.905422] uvcvideo: Dropping payload (out of sync).
[10446.905430] uvcvideo: Dropping payload (out of sync).
[10446.905435] uvcvideo: Dropping payload (out of sync).
[10446.905443] uvcvideo: Dropping payload (out of sync).
[10446.905447] uvcvideo: Dropping payload (out of sync).
[10446.905452] uvcvideo: Dropping payload (out of sync).
[10446.905457] uvcvideo: Dropping payload (out of sync).
[10446.905462] uvcvideo: Dropping payload (out of sync).
[10446.905467] uvcvideo: Dropping payload (out of sync).
[10446.905471] uvcvideo: Dropping payload (out of sync).
[10446.905603] uvcvideo: Dropping payload (out of sync).
[10446.905610] uvcvideo: Dropping payload (out of sync).
[10446.905614] uvcvideo: Dropping payload (out of sync).
[10446.905746] uvcvideo: Dropping payload (out of sync).
[10446.905755] uvcvideo: Dropping payload (out of sync).
[10446.905759] uvcvideo: Dropping payload (out of sync).
[10446.905764] uvcvideo: Dropping payload (out of sync).
[10446.905768] uvcvideo: Dropping payload (out of sync).
[10446.905771] uvcvideo: Dropping payload (out of sync).
[10446.905778] uvcvideo: Dropping payload (out of sync).
[10446.905782] uvcvideo: Dropping payload (out of sync).
[10446.905785] uvcvideo: Dropping payload (out of sync).
[10446.905789] uvcvideo: Dropping payload (out of sync).
[10446.905792] uvcvideo: Dropping payload (out of sync).
[10446.905798] uvcvideo: frame 205621 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 328728407/329237621/1410
[10446.906416] uvcvideo: uvc_v4l2_poll
[10446.933355] uvcvideo: Frame complete (EOF found).
[10446.933365] uvcvideo: Dropping payload (out of sync).
[10446.933369] uvcvideo: Dropping payload (out of sync).
[10446.933372] uvcvideo: Dropping payload (out of sync).
[10446.933505] uvcvideo: Dropping payload (out of sync).
[10446.933517] uvcvideo: Dropping payload (out of sync).
[10446.933521] uvcvideo: Dropping payload (out of sync).
[10446.933656] uvcvideo: Dropping payload (out of sync).
[10446.933664] uvcvideo: Dropping payload (out of sync).
[10446.933669] uvcvideo: Dropping payload (out of sync).
[10446.933673] uvcvideo: Dropping payload (out of sync).
[10446.933678] uvcvideo: Dropping payload (out of sync).
[10446.933683] uvcvideo: Dropping payload (out of sync).
[10446.933691] uvcvideo: Dropping payload (out of sync).
[10446.933694] uvcvideo: Dropping payload (out of sync).
[10446.933699] uvcvideo: Dropping payload (out of sync).
[10446.933704] uvcvideo: Dropping payload (out of sync).
[10446.933708] uvcvideo: Dropping payload (out of sync).
[10446.933850] uvcvideo: uvc_v4l2_poll
[10446.937395] uvcvideo: Dropping payload (out of sync).
[10446.937404] uvcvideo: Dropping payload (out of sync).
[10446.937408] uvcvideo: Dropping payload (out of sync).
[10446.937416] uvcvideo: Dropping payload (out of sync).
[10446.937421] uvcvideo: Dropping payload (out of sync).
[10446.937426] uvcvideo: Dropping payload (out of sync).
[10446.937430] uvcvideo: Dropping payload (out of sync).
[10446.937435] uvcvideo: Dropping payload (out of sync).
[10446.937439] uvcvideo: Dropping payload (out of sync).
[10446.937443] uvcvideo: Dropping payload (out of sync).
[10446.937448] uvcvideo: Dropping payload (out of sync).
[10446.937455] uvcvideo: Dropping payload (out of sync).
[10446.937459] uvcvideo: Dropping payload (out of sync).
[10446.937598] uvcvideo: Dropping payload (out of sync).
[10446.937602] uvcvideo: Dropping payload (out of sync).
[10446.937607] uvcvideo: Dropping payload (out of sync).
[10446.937611] uvcvideo: Dropping payload (out of sync).
[10446.937788] uvcvideo: Dropping payload (out of sync).
[10446.937793] uvcvideo: Dropping payload (out of sync).
[10446.937799] uvcvideo: Dropping payload (out of sync).
[10446.937802] uvcvideo: Dropping payload (out of sync).
[10446.937805] uvcvideo: Dropping payload (out of sync).
[10446.937810] uvcvideo: Dropping payload (out of sync).
[10446.937814] uvcvideo: Dropping payload (out of sync).
[10446.937818] uvcvideo: Dropping payload (out of sync).
[10446.937821] uvcvideo: Dropping payload (out of sync).
[10446.937826] uvcvideo: Dropping payload (out of sync).
[10446.937833] uvcvideo: Dropping payload (out of sync).
[10446.937839] uvcvideo: Dropping payload (out of sync).
[10446.937842] uvcvideo: Dropping payload (out of sync).
[10446.937846] uvcvideo: Dropping payload (out of sync).
[10446.937849] uvcvideo: Dropping payload (out of sync).
[10446.938234] uvcvideo: uvc_v4l2_poll
[10446.941351] uvcvideo: Dropping payload (out of sync).
[10446.941354] uvcvideo: Dropping payload (out of sync).
[10446.941355] uvcvideo: Dropping payload (out of sync).
[10446.941360] uvcvideo: frame 205622 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 329228830/329738239/1443
[10446.965362] uvcvideo: Frame complete (EOF found).
[10446.965372] uvcvideo: Dropping payload (out of sync).
[10446.965378] uvcvideo: Dropping payload (out of sync).
[10446.965382] uvcvideo: Dropping payload (out of sync).
[10446.965450] uvcvideo: Dropping payload (out of sync).
[10446.965456] uvcvideo: Dropping payload (out of sync).
[10446.965460] uvcvideo: Dropping payload (out of sync).
[10446.965533] uvcvideo: uvc_v4l2_poll
[10446.969347] uvcvideo: Dropping payload (out of sync).
[10446.969354] uvcvideo: Dropping payload (out of sync).
[10446.969357] uvcvideo: Dropping payload (out of sync).
[10446.969426] uvcvideo: Dropping payload (out of sync).
[10446.969434] uvcvideo: Dropping payload (out of sync).
[10446.969437] uvcvideo: Dropping payload (out of sync).
[10446.969506] uvcvideo: Dropping payload (out of sync).
[10446.969514] uvcvideo: Dropping payload (out of sync).
[10446.969519] uvcvideo: Dropping payload (out of sync).
[10446.969523] uvcvideo: Dropping payload (out of sync).
[10446.969528] uvcvideo: Dropping payload (out of sync).
[10446.969536] uvcvideo: Dropping payload (out of sync).
[10446.969540] uvcvideo: Dropping payload (out of sync).
[10446.969543] uvcvideo: Dropping payload (out of sync).
[10446.969611] uvcvideo: Dropping payload (out of sync).
[10446.969618] uvcvideo: Dropping payload (out of sync).
[10446.969621] uvcvideo: Dropping payload (out of sync).
[10446.969688] uvcvideo: Dropping payload (out of sync).
[10446.969692] uvcvideo: Dropping payload (out of sync).
[10446.969698] uvcvideo: Dropping payload (out of sync).
[10446.969702] uvcvideo: Dropping payload (out of sync).
[10446.969707] uvcvideo: Dropping payload (out of sync).
[10446.969712] uvcvideo: Dropping payload (out of sync).
[10446.969715] uvcvideo: Dropping payload (out of sync).
[10446.969719] uvcvideo: Dropping payload (out of sync).
[10446.969785] uvcvideo: Dropping payload (out of sync).
[10446.969788] uvcvideo: Dropping payload (out of sync).
[10446.969793] uvcvideo: Dropping payload (out of sync).
[10446.969796] uvcvideo: Dropping payload (out of sync).
[10446.969865] uvcvideo: Dropping payload (out of sync).
[10446.969876] uvcvideo: Dropping payload (out of sync).
[10446.969879] uvcvideo: Dropping payload (out of sync).
[10446.970322] uvcvideo: uvc_v4l2_poll
[10446.973373] uvcvideo: Dropping payload (out of sync).
[10446.973375] uvcvideo: Dropping payload (out of sync).
[10446.973375] uvcvideo: Dropping payload (out of sync).
[10446.973380] uvcvideo: Dropping payload (out of sync).
[10446.973380] uvcvideo: Dropping payload (out of sync).
[10446.973381] uvcvideo: Dropping payload (out of sync).
[10446.973381] uvcvideo: Dropping payload (out of sync).
[10446.973382] uvcvideo: Dropping payload (out of sync).
[10446.973382] uvcvideo: Dropping payload (out of sync).
[10446.973382] uvcvideo: Dropping payload (out of sync).
[10446.973383] uvcvideo: Dropping payload (out of sync).
[10446.973450] uvcvideo: Dropping payload (out of sync).
[10446.973451] uvcvideo: Dropping payload (out of sync).
[10446.973451] uvcvideo: Dropping payload (out of sync).
[10446.973454] uvcvideo: frame 205623 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 329729254/330238858/1477
[10447.001350] uvcvideo: Frame complete (EOF found).
[10447.001360] uvcvideo: Dropping payload (out of sync).
[10447.001363] uvcvideo: Dropping payload (out of sync).
[10447.001366] uvcvideo: Dropping payload (out of sync).
[10447.001453] uvcvideo: Dropping payload (out of sync).
[10447.001457] uvcvideo: Dropping payload (out of sync).
[10447.001460] uvcvideo: Dropping payload (out of sync).
[10447.001550] uvcvideo: Dropping payload (out of sync).
[10447.001558] uvcvideo: Dropping payload (out of sync).
[10447.001563] uvcvideo: Dropping payload (out of sync).
[10447.001567] uvcvideo: Dropping payload (out of sync).
[10447.001572] uvcvideo: Dropping payload (out of sync).
[10447.001577] uvcvideo: Dropping payload (out of sync).
[10447.001580] uvcvideo: Dropping payload (out of sync).
[10447.001585] uvcvideo: Dropping payload (out of sync).
[10447.001593] uvcvideo: Dropping payload (out of sync).
[10447.001678] uvcvideo: Dropping payload (out of sync).
[10447.001686] uvcvideo: Dropping payload (out of sync).
[10447.001689] uvcvideo: Dropping payload (out of sync).
[10447.001774] uvcvideo: Dropping payload (out of sync).
[10447.001782] uvcvideo: Dropping payload (out of sync).
[10447.001785] uvcvideo: Dropping payload (out of sync).
[10447.001788] uvcvideo: Dropping payload (out of sync).
[10447.001794] uvcvideo: Dropping payload (out of sync).
[10447.001797] uvcvideo: Dropping payload (out of sync).
[10447.001800] uvcvideo: Dropping payload (out of sync).
[10447.001802] uvcvideo: Dropping payload (out of sync).
[10447.001804] uvcvideo: Dropping payload (out of sync).
[10447.001907] uvcvideo: uvc_v4l2_poll
[10447.004557] uvcvideo: uvc_v4l2_poll
[10447.005383] uvcvideo: Dropping payload (out of sync).
[10447.005385] uvcvideo: Dropping payload (out of sync).
[10447.005386] uvcvideo: Dropping payload (out of sync).
[10447.005393] uvcvideo: Dropping payload (out of sync).
[10447.005394] uvcvideo: Dropping payload (out of sync).
[10447.005394] uvcvideo: Dropping payload (out of sync).
[10447.005395] uvcvideo: Dropping payload (out of sync).
[10447.005395] uvcvideo: Dropping payload (out of sync).
[10447.005396] uvcvideo: Dropping payload (out of sync).
[10447.005396] uvcvideo: Dropping payload (out of sync).
[10447.005397] uvcvideo: Dropping payload (out of sync).
[10447.005400] uvcvideo: Dropping payload (out of sync).
[10447.005400] uvcvideo: Dropping payload (out of sync).
[10447.005401] uvcvideo: Dropping payload (out of sync).
[10447.005401] uvcvideo: Dropping payload (out of sync).
[10447.005402] uvcvideo: Dropping payload (out of sync).
[10447.005402] uvcvideo: Dropping payload (out of sync).
[10447.005403] uvcvideo: Dropping payload (out of sync).
[10447.005403] uvcvideo: Dropping payload (out of sync).
[10447.005407] uvcvideo: Dropping payload (out of sync).
[10447.005407] uvcvideo: Dropping payload (out of sync).
[10447.005408] uvcvideo: Dropping payload (out of sync).
[10447.005408] uvcvideo: Dropping payload (out of sync).
[10447.005409] uvcvideo: Dropping payload (out of sync).
[10447.005412] uvcvideo: frame 205624 stats: 0/169/266 packets, 0/0/266 pts (!early initial), 265/266 scr, last pts/stc/sof 330229677/330737601/1510
[10447.033355] uvcvideo: Frame complete (EOF found).
[10447.033364] uvcvideo: Dropping payload (out of sync).
[10447.033367] uvcvideo: Dropping payload (out of sync).
[10447.033371] uvcvideo: Dropping payload (out of sync).
[10447.033438] uvcvideo: Dropping payload (out of sync).
[10447.033448] uvcvideo: Dropping payload (out of sync).
[10447.033452] uvcvideo: Dropping payload (out of sync).
[10447.033520] uvcvideo: Dropping payload (out of sync).
[10447.033528] uvcvideo: Dropping payload (out of sync).
[10447.033533] uvcvideo: Dropping payload (out of sync).
[10447.033536] uvcvideo: Dropping payload (out of sync).
[10447.033540] uvcvideo: Dropping payload (out of sync).
[10447.033545] uvcvideo: Dropping payload (out of sync).
[10447.033552] uvcvideo: Dropping payload (out of sync).
[10447.033556] uvcvideo: Dropping payload (out of sync).
[10447.033623] uvcvideo: Dropping payload (out of sync).
[10447.033630] uvcvideo: Dropping payload (out of sync).
[10447.033634] uvcvideo: Dropping payload (out of sync).
[10447.033701] uvcvideo: uvc_v4l2_poll
[10447.037366] uvcvideo: Dropping payload (out of sync).
[10447.037371] uvcvideo: Dropping payload (out of sync).
[10447.037375] uvcvideo: Dropping payload (out of sync).
[10447.037383] uvcvideo: Dropping payload (out of sync).
[10447.037388] uvcvideo: Dropping payload (out of sync).
[10447.037391] uvcvideo: Dropping payload (out of sync).
[10447.037395] uvcvideo: Dropping payload (out of sync).
[10447.037400] uvcvideo: Dropping payload (out of sync).
[10447.037404] uvcvideo: Dropping payload (out of sync).
[10447.037513] uvcvideo: Dropping payload (out of sync).
[10447.037521] uvcvideo: Dropping payload (out of sync).
[10447.037529] uvcvideo: Dropping payload (out of sync).
[10447.037638] uvcvideo: Dropping payload (out of sync).
[10447.037646] uvcvideo: Dropping payload (out of sync).
[10447.037651] uvcvideo: Dropping payload (out of sync).
[10447.037656] uvcvideo: Dropping payload (out of sync).
[10447.037660] uvcvideo: Dropping payload (out of sync).
[10447.037665] uvcvideo: Dropping payload (out of sync).
[10447.037669] uvcvideo: Dropping payload (out of sync).
[10447.037676] uvcvideo: Dropping payload (out of sync).
[10447.037681] uvcvideo: Dropping payload (out of sync).
[10447.037789] uvcvideo: Dropping payload (out of sync).
[10447.037807] uvcvideo: Dropping payload (out of sync).
[10447.037812] uvcvideo: Dropping payload (out of sync).
[10447.037920] uvcvideo: Dropping payload (out of sync).
[10447.037929] uvcvideo: Dropping payload (out of sync).
[10447.037934] uvcvideo: Dropping payload (out of sync).
[10447.037939] uvcvideo: Dropping payload (out of sync).
[10447.037944] uvcvideo: Dropping payload (out of sync).
[10447.037948] uvcvideo: Dropping payload (out of sync).
[10447.037952] uvcvideo: Dropping payload (out of sync).
[10447.037957] uvcvideo: Dropping payload (out of sync).
[10447.038658] uvcvideo: uvc_v4l2_poll
[10447.041349] uvcvideo: Dropping payload (out of sync).
[10447.041350] uvcvideo: Dropping payload (out of sync).
[10447.041351] uvcvideo: Dropping payload (out of sync).
[10447.041353] uvcvideo: frame 205625 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 330730101/331238219/1543
[10447.065360] uvcvideo: Frame complete (EOF found).
[10447.065369] uvcvideo: Dropping payload (out of sync).
[10447.065376] uvcvideo: Dropping payload (out of sync).
[10447.065379] uvcvideo: Dropping payload (out of sync).
[10447.065486] uvcvideo: Dropping payload (out of sync).
[10447.065495] uvcvideo: Dropping payload (out of sync).
[10447.065500] uvcvideo: Dropping payload (out of sync).
[10447.065616] uvcvideo: uvc_v4l2_poll
[10447.069348] uvcvideo: Dropping payload (out of sync).
[10447.069355] uvcvideo: Dropping payload (out of sync).
[10447.069359] uvcvideo: Dropping payload (out of sync).
[10447.069494] uvcvideo: Dropping payload (out of sync).
[10447.069502] uvcvideo: Dropping payload (out of sync).
[10447.069507] uvcvideo: Dropping payload (out of sync).
[10447.069512] uvcvideo: Dropping payload (out of sync).
[10447.069645] uvcvideo: Dropping payload (out of sync).
[10447.069649] uvcvideo: Dropping payload (out of sync).
[10447.069654] uvcvideo: Dropping payload (out of sync).
[10447.069657] uvcvideo: Dropping payload (out of sync).
[10447.069664] uvcvideo: Dropping payload (out of sync).
[10447.069669] uvcvideo: Dropping payload (out of sync).
[10447.069674] uvcvideo: Dropping payload (out of sync).
[10447.069678] uvcvideo: Dropping payload (out of sync).
[10447.069683] uvcvideo: Dropping payload (out of sync).
[10447.069688] uvcvideo: Dropping payload (out of sync).
[10447.069692] uvcvideo: Dropping payload (out of sync).
[10447.069696] uvcvideo: Dropping payload (out of sync).
[10447.069705] uvcvideo: Dropping payload (out of sync).
[10447.069835] uvcvideo: Dropping payload (out of sync).
[10447.069839] uvcvideo: Dropping payload (out of sync).
[10447.069843] uvcvideo: Dropping payload (out of sync).
[10447.069846] uvcvideo: Dropping payload (out of sync).
[10447.069850] uvcvideo: Dropping payload (out of sync).
[10447.069855] uvcvideo: Dropping payload (out of sync).
[10447.069860] uvcvideo: Dropping payload (out of sync).
[10447.069992] uvcvideo: Dropping payload (out of sync).
[10447.069995] uvcvideo: Dropping payload (out of sync).
[10447.069998] uvcvideo: Dropping payload (out of sync).
[10447.070002] uvcvideo: Dropping payload (out of sync).
[10447.070007] uvcvideo: Dropping payload (out of sync).
[10447.070319] uvcvideo: uvc_v4l2_poll
[10447.073365] uvcvideo: Dropping payload (out of sync).
[10447.073366] uvcvideo: Dropping payload (out of sync).
[10447.073367] uvcvideo: Dropping payload (out of sync).
[10447.073374] uvcvideo: Dropping payload (out of sync).
[10447.073374] uvcvideo: Dropping payload (out of sync).
[10447.073375] uvcvideo: Dropping payload (out of sync).
[10447.073375] uvcvideo: Dropping payload (out of sync).
[10447.073376] uvcvideo: Dropping payload (out of sync).
[10447.073376] uvcvideo: Dropping payload (out of sync).
[10447.073377] uvcvideo: Dropping payload (out of sync).
[10447.073377] uvcvideo: Dropping payload (out of sync).
[10447.073380] uvcvideo: Dropping payload (out of sync).
[10447.073380] uvcvideo: Dropping payload (out of sync).
[10447.073381] uvcvideo: Dropping payload (out of sync).
[10447.073383] uvcvideo: frame 205626 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 331230524/331738836/1577
[10447.101353] uvcvideo: Frame complete (EOF found).
[10447.101364] uvcvideo: Dropping payload (out of sync).
[10447.101368] uvcvideo: Dropping payload (out of sync).
[10447.101372] uvcvideo: Dropping payload (out of sync).
[10447.101504] uvcvideo: Dropping payload (out of sync).
[10447.101512] uvcvideo: Dropping payload (out of sync).
[10447.101517] uvcvideo: Dropping payload (out of sync).
[10447.101524] uvcvideo: Dropping payload (out of sync).
[10447.101656] uvcvideo: Dropping payload (out of sync).
[10447.101664] uvcvideo: Dropping payload (out of sync).
[10447.101669] uvcvideo: Dropping payload (out of sync).
[10447.101673] uvcvideo: Dropping payload (out of sync).
[10447.101678] uvcvideo: Dropping payload (out of sync).
[10447.101681] uvcvideo: Dropping payload (out of sync).
[10447.101685] uvcvideo: Dropping payload (out of sync).
[10447.101691] uvcvideo: Dropping payload (out of sync).
[10447.101696] uvcvideo: Dropping payload (out of sync).
[10447.101702] uvcvideo: Dropping payload (out of sync).
[10447.101706] uvcvideo: Dropping payload (out of sync).
[10447.101711] uvcvideo: Dropping payload (out of sync).
[10447.101716] uvcvideo: Dropping payload (out of sync).
[10447.101720] uvcvideo: Dropping payload (out of sync).
[10447.101725] uvcvideo: Dropping payload (out of sync).
[10447.101733] uvcvideo: Dropping payload (out of sync).
[10447.101863] uvcvideo: Dropping payload (out of sync).
[10447.101869] uvcvideo: Dropping payload (out of sync).
[10447.101873] uvcvideo: Dropping payload (out of sync).
[10447.101877] uvcvideo: Dropping payload (out of sync).
[10447.102037] uvcvideo: uvc_v4l2_poll
[10447.105448] uvcvideo: Dropping payload (out of sync).
[10447.105460] uvcvideo: Dropping payload (out of sync).
[10447.105465] uvcvideo: Dropping payload (out of sync).
[10447.105473] uvcvideo: Dropping payload (out of sync).
[10447.105476] uvcvideo: Dropping payload (out of sync).
[10447.105480] uvcvideo: Dropping payload (out of sync).
[10447.105485] uvcvideo: Dropping payload (out of sync).
[10447.105489] uvcvideo: Dropping payload (out of sync).
[10447.105493] uvcvideo: Dropping payload (out of sync).
[10447.105497] uvcvideo: Dropping payload (out of sync).
[10447.105627] uvcvideo: Dropping payload (out of sync).
[10447.105638] uvcvideo: Dropping payload (out of sync).
[10447.105642] uvcvideo: Dropping payload (out of sync).
[10447.105773] uvcvideo: Dropping payload (out of sync).
[10447.105780] uvcvideo: Dropping payload (out of sync).
[10447.105785] uvcvideo: Dropping payload (out of sync).
[10447.105788] uvcvideo: Dropping payload (out of sync).
[10447.105793] uvcvideo: Dropping payload (out of sync).
[10447.105796] uvcvideo: Dropping payload (out of sync).
[10447.105803] uvcvideo: Dropping payload (out of sync).
[10447.105808] uvcvideo: Dropping payload (out of sync).
[10447.105812] uvcvideo: Dropping payload (out of sync).
[10447.105816] uvcvideo: Dropping payload (out of sync).
[10447.105820] uvcvideo: Dropping payload (out of sync).
[10447.105824] uvcvideo: Dropping payload (out of sync).
[10447.105831] uvcvideo: frame 205627 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 331730947/332239453/1610
[10447.106480] uvcvideo: uvc_v4l2_poll
[10447.133359] uvcvideo: Frame complete (EOF found).
[10447.133372] uvcvideo: Dropping payload (out of sync).
[10447.133377] uvcvideo: Dropping payload (out of sync).
[10447.133380] uvcvideo: Dropping payload (out of sync).
[10447.133387] uvcvideo: Dropping payload (out of sync).
[10447.133517] uvcvideo: Dropping payload (out of sync).
[10447.133526] uvcvideo: Dropping payload (out of sync).
[10447.133530] uvcvideo: Dropping payload (out of sync).
[10447.133535] uvcvideo: Dropping payload (out of sync).
[10447.133540] uvcvideo: Dropping payload (out of sync).
[10447.133679] uvcvideo: Dropping payload (out of sync).
[10447.133683] uvcvideo: Dropping payload (out of sync).
[10447.133691] uvcvideo: Dropping payload (out of sync).
[10447.133695] uvcvideo: Dropping payload (out of sync).
[10447.133700] uvcvideo: Dropping payload (out of sync).
[10447.133704] uvcvideo: Dropping payload (out of sync).
[10447.133709] uvcvideo: Dropping payload (out of sync).
[10447.133758] uvcvideo: uvc_v4l2_poll
[10447.137470] uvcvideo: Dropping payload (out of sync).
[10447.137474] uvcvideo: Dropping payload (out of sync).
[10447.137477] uvcvideo: Dropping payload (out of sync).
[10447.137484] uvcvideo: Dropping payload (out of sync).
[10447.137487] uvcvideo: Dropping payload (out of sync).
[10447.137491] uvcvideo: Dropping payload (out of sync).
[10447.137496] uvcvideo: Dropping payload (out of sync).
[10447.137499] uvcvideo: Dropping payload (out of sync).
[10447.137503] uvcvideo: Dropping payload (out of sync).
[10447.137507] uvcvideo: Dropping payload (out of sync).
[10447.137512] uvcvideo: Dropping payload (out of sync).
[10447.137517] uvcvideo: Dropping payload (out of sync).
[10447.137648] uvcvideo: Dropping payload (out of sync).
[10447.137652] uvcvideo: Dropping payload (out of sync).
[10447.137657] uvcvideo: Dropping payload (out of sync).
[10447.137662] uvcvideo: Dropping payload (out of sync).
[10447.137793] uvcvideo: Dropping payload (out of sync).
[10447.137797] uvcvideo: Dropping payload (out of sync).
[10447.137801] uvcvideo: Dropping payload (out of sync).
[10447.137808] uvcvideo: Dropping payload (out of sync).
[10447.137812] uvcvideo: Dropping payload (out of sync).
[10447.137817] uvcvideo: Dropping payload (out of sync).
[10447.137820] uvcvideo: Dropping payload (out of sync).
[10447.137823] uvcvideo: Dropping payload (out of sync).
[10447.137825] uvcvideo: Dropping payload (out of sync).
[10447.137828] uvcvideo: Dropping payload (out of sync).
[10447.137830] uvcvideo: Dropping payload (out of sync).
[10447.137835] uvcvideo: Dropping payload (out of sync).
[10447.137837] uvcvideo: Dropping payload (out of sync).
[10447.137839] uvcvideo: Dropping payload (out of sync).
[10447.137842] uvcvideo: Dropping payload (out of sync).
[10447.137844] uvcvideo: Dropping payload (out of sync).
[10447.138165] uvcvideo: uvc_v4l2_poll
[10447.141341] uvcvideo: Dropping payload (out of sync).
[10447.141342] uvcvideo: Dropping payload (out of sync).
[10447.141343] uvcvideo: Dropping payload (out of sync).
[10447.141346] uvcvideo: Dropping payload (out of sync).
[10447.141348] uvcvideo: frame 205628 stats: 0/166/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 332231371/332740071/1644
[10447.165361] uvcvideo: Frame complete (EOF found).
[10447.165372] uvcvideo: Dropping payload (out of sync).
[10447.165503] uvcvideo: Dropping payload (out of sync).
[10447.165511] uvcvideo: Dropping payload (out of sync).
[10447.165516] uvcvideo: Dropping payload (out of sync).
[10447.165521] uvcvideo: Dropping payload (out of sync).
[10447.165655] uvcvideo: uvc_v4l2_poll
[10447.169348] uvcvideo: Dropping payload (out of sync).
[10447.169354] uvcvideo: Dropping payload (out of sync).
[10447.169358] uvcvideo: Dropping payload (out of sync).
[10447.169492] uvcvideo: Dropping payload (out of sync).
[10447.169504] uvcvideo: Dropping payload (out of sync).
[10447.169508] uvcvideo: Dropping payload (out of sync).
[10447.169513] uvcvideo: Dropping payload (out of sync).
[10447.169518] uvcvideo: Dropping payload (out of sync).
[10447.169657] uvcvideo: Dropping payload (out of sync).
[10447.169661] uvcvideo: Dropping payload (out of sync).
[10447.169665] uvcvideo: Dropping payload (out of sync).
[10447.169671] uvcvideo: Dropping payload (out of sync).
[10447.169675] uvcvideo: Dropping payload (out of sync).
[10447.169680] uvcvideo: Dropping payload (out of sync).
[10447.169684] uvcvideo: Dropping payload (out of sync).
[10447.169688] uvcvideo: Dropping payload (out of sync).
[10447.169693] uvcvideo: Dropping payload (out of sync).
[10447.169697] uvcvideo: Dropping payload (out of sync).
[10447.169703] uvcvideo: Dropping payload (out of sync).
[10447.169708] uvcvideo: Dropping payload (out of sync).
[10447.169712] uvcvideo: Dropping payload (out of sync).
[10447.169716] uvcvideo: Dropping payload (out of sync).
[10447.169721] uvcvideo: Dropping payload (out of sync).
[10447.169726] uvcvideo: Dropping payload (out of sync).
[10447.169730] uvcvideo: Dropping payload (out of sync).
[10447.169862] uvcvideo: Dropping payload (out of sync).
[10447.169865] uvcvideo: Dropping payload (out of sync).
[10447.169870] uvcvideo: Dropping payload (out of sync).
[10447.169873] uvcvideo: Dropping payload (out of sync).
[10447.169875] uvcvideo: Dropping payload (out of sync).
[10447.169878] uvcvideo: Dropping payload (out of sync).
[10447.169880] uvcvideo: Dropping payload (out of sync).
[10447.170209] uvcvideo: uvc_v4l2_poll
[10447.173464] uvcvideo: Dropping payload (out of sync).
[10447.173466] uvcvideo: Dropping payload (out of sync).
[10447.173467] uvcvideo: Dropping payload (out of sync).
[10447.173470] uvcvideo: Dropping payload (out of sync).
[10447.173470] uvcvideo: Dropping payload (out of sync).
[10447.173471] uvcvideo: Dropping payload (out of sync).
[10447.173471] uvcvideo: Dropping payload (out of sync).
[10447.173472] uvcvideo: Dropping payload (out of sync).
[10447.173472] uvcvideo: Dropping payload (out of sync).
[10447.173473] uvcvideo: Dropping payload (out of sync).
[10447.173473] uvcvideo: Dropping payload (out of sync).
[10447.173476] uvcvideo: Dropping payload (out of sync).
[10447.173476] uvcvideo: Dropping payload (out of sync).
[10447.173477] uvcvideo: Dropping payload (out of sync).
[10447.173477] uvcvideo: Dropping payload (out of sync).
[10447.173480] uvcvideo: frame 205629 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 332731794/333240688/1677
[10447.201345] uvcvideo: Frame complete (EOF found).
[10447.201349] uvcvideo: Dropping payload (out of sync).
[10447.201350] uvcvideo: Dropping payload (out of sync).
[10447.201351] uvcvideo: Dropping payload (out of sync).
[10447.201352] uvcvideo: Dropping payload (out of sync).
[10447.201353] uvcvideo: Dropping payload (out of sync).
[10447.201356] uvcvideo: Dropping payload (out of sync).
[10447.201357] uvcvideo: Dropping payload (out of sync).
[10447.201358] uvcvideo: Dropping payload (out of sync).
[10447.201359] uvcvideo: Dropping payload (out of sync).
[10447.201359] uvcvideo: Dropping payload (out of sync).
[10447.201360] uvcvideo: Dropping payload (out of sync).
[10447.201361] uvcvideo: Dropping payload (out of sync).
[10447.201362] uvcvideo: Dropping payload (out of sync).
[10447.201366] uvcvideo: Dropping payload (out of sync).
[10447.201367] uvcvideo: Dropping payload (out of sync).
[10447.201368] uvcvideo: Dropping payload (out of sync).
[10447.201369] uvcvideo: Dropping payload (out of sync).
[10447.201370] uvcvideo: Dropping payload (out of sync).
[10447.201371] uvcvideo: Dropping payload (out of sync).
[10447.201372] uvcvideo: Dropping payload (out of sync).
[10447.201372] uvcvideo: Dropping payload (out of sync).
[10447.201376] uvcvideo: Dropping payload (out of sync).
[10447.201377] uvcvideo: Dropping payload (out of sync).
[10447.201378] uvcvideo: Dropping payload (out of sync).
[10447.201379] uvcvideo: Dropping payload (out of sync).
[10447.201380] uvcvideo: Dropping payload (out of sync).
[10447.201422] uvcvideo: uvc_v4l2_poll
[10447.205360] uvcvideo: Dropping payload (out of sync).
[10447.205363] uvcvideo: Dropping payload (out of sync).
[10447.205364] uvcvideo: Dropping payload (out of sync).
[10447.205369] uvcvideo: Dropping payload (out of sync).
[10447.205370] uvcvideo: Dropping payload (out of sync).
[10447.205371] uvcvideo: Dropping payload (out of sync).
[10447.205372] uvcvideo: Dropping payload (out of sync).
[10447.205373] uvcvideo: Dropping payload (out of sync).
[10447.205374] uvcvideo: Dropping payload (out of sync).
[10447.205374] uvcvideo: Dropping payload (out of sync).
[10447.205375] uvcvideo: Dropping payload (out of sync).
[10447.205379] uvcvideo: Dropping payload (out of sync).
[10447.205380] uvcvideo: Dropping payload (out of sync).
[10447.205381] uvcvideo: Dropping payload (out of sync).
[10447.205381] uvcvideo: Dropping payload (out of sync).
[10447.205382] uvcvideo: Dropping payload (out of sync).
[10447.205383] uvcvideo: Dropping payload (out of sync).
[10447.205384] uvcvideo: Dropping payload (out of sync).
[10447.205385] uvcvideo: Dropping payload (out of sync).
[10447.205389] uvcvideo: Dropping payload (out of sync).
[10447.205390] uvcvideo: Dropping payload (out of sync).
[10447.205391] uvcvideo: Dropping payload (out of sync).
[10447.205392] uvcvideo: Dropping payload (out of sync).
[10447.205393] uvcvideo: Dropping payload (out of sync).
[10447.205393] uvcvideo: Dropping payload (out of sync).
[10447.205394] uvcvideo: Dropping payload (out of sync).
[10447.205400] uvcvideo: frame 205630 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 333232218/333741305/1710
[10447.205406] uvcvideo: uvc_v4l2_poll
[10447.233352] uvcvideo: Frame complete (EOF found).
[10447.233354] uvcvideo: Dropping payload (out of sync).
[10447.233355] uvcvideo: Dropping payload (out of sync).
[10447.233358] uvcvideo: Dropping payload (out of sync).
[10447.233359] uvcvideo: Dropping payload (out of sync).
[10447.233359] uvcvideo: Dropping payload (out of sync).
[10447.233360] uvcvideo: Dropping payload (out of sync).
[10447.233361] uvcvideo: Dropping payload (out of sync).
[10447.233361] uvcvideo: Dropping payload (out of sync).
[10447.233362] uvcvideo: Dropping payload (out of sync).
[10447.233363] uvcvideo: Dropping payload (out of sync).
[10447.233366] uvcvideo: Dropping payload (out of sync).
[10447.233366] uvcvideo: Dropping payload (out of sync).
[10447.233367] uvcvideo: Dropping payload (out of sync).
[10447.233368] uvcvideo: Dropping payload (out of sync).
[10447.233368] uvcvideo: Dropping payload (out of sync).
[10447.233405] uvcvideo: uvc_v4l2_poll
[10447.237461] uvcvideo: Dropping payload (out of sync).
[10447.237463] uvcvideo: Dropping payload (out of sync).
[10447.237463] uvcvideo: Dropping payload (out of sync).
[10447.237466] uvcvideo: Dropping payload (out of sync).
[10447.237467] uvcvideo: Dropping payload (out of sync).
[10447.237467] uvcvideo: Dropping payload (out of sync).
[10447.237468] uvcvideo: Dropping payload (out of sync).
[10447.237468] uvcvideo: Dropping payload (out of sync).
[10447.237469] uvcvideo: Dropping payload (out of sync).
[10447.237469] uvcvideo: Dropping payload (out of sync).
[10447.237470] uvcvideo: Dropping payload (out of sync).
[10447.237472] uvcvideo: Dropping payload (out of sync).
[10447.237473] uvcvideo: Dropping payload (out of sync).
[10447.237473] uvcvideo: Dropping payload (out of sync).
[10447.237474] uvcvideo: Dropping payload (out of sync).
[10447.237474] uvcvideo: Dropping payload (out of sync).
[10447.237475] uvcvideo: Dropping payload (out of sync).
[10447.237622] uvcvideo: Dropping payload (out of sync).
[10447.237623] uvcvideo: Dropping payload (out of sync).
[10447.237630] uvcvideo: Dropping payload (out of sync).
[10447.237631] uvcvideo: Dropping payload (out of sync).
[10447.237631] uvcvideo: Dropping payload (out of sync).
[10447.237632] uvcvideo: Dropping payload (out of sync).
[10447.237632] uvcvideo: Dropping payload (out of sync).
[10447.237633] uvcvideo: Dropping payload (out of sync).
[10447.237633] uvcvideo: Dropping payload (out of sync).
[10447.237634] uvcvideo: Dropping payload (out of sync).
[10447.237636] uvcvideo: Dropping payload (out of sync).
[10447.237637] uvcvideo: Dropping payload (out of sync).
[10447.237637] uvcvideo: Dropping payload (out of sync).
[10447.237638] uvcvideo: Dropping payload (out of sync).
[10447.237639] uvcvideo: Dropping payload (out of sync).
[10447.238540] uvcvideo: uvc_v4l2_poll
[10447.241440] uvcvideo: Dropping payload (out of sync).
[10447.241441] uvcvideo: Dropping payload (out of sync).
[10447.241442] uvcvideo: Dropping payload (out of sync).
[10447.241450] uvcvideo: Dropping payload (out of sync).
[10447.241450] uvcvideo: Dropping payload (out of sync).
[10447.241453] uvcvideo: frame 205631 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 333732641/334241922/1744
[10447.265364] uvcvideo: Frame complete (EOF found).
[10447.265374] uvcvideo: Dropping payload (out of sync).
[10447.265379] uvcvideo: Dropping payload (out of sync).
[10447.265384] uvcvideo: Dropping payload (out of sync).
[10447.265521] uvcvideo: Dropping payload (out of sync).
[10447.265676] uvcvideo: uvc_v4l2_poll
[10447.269350] uvcvideo: Dropping payload (out of sync).
[10447.269358] uvcvideo: Dropping payload (out of sync).
[10447.269492] uvcvideo: Dropping payload (out of sync).
[10447.269499] uvcvideo: Dropping payload (out of sync).
[10447.269503] uvcvideo: Dropping payload (out of sync).
[10447.269507] uvcvideo: Dropping payload (out of sync).
[10447.269512] uvcvideo: Dropping payload (out of sync).
[10447.269689] uvcvideo: Dropping payload (out of sync).
[10447.269694] uvcvideo: Dropping payload (out of sync).
[10447.269698] uvcvideo: Dropping payload (out of sync).
[10447.269703] uvcvideo: Dropping payload (out of sync).
[10447.269711] uvcvideo: Dropping payload (out of sync).
[10447.269715] uvcvideo: Dropping payload (out of sync).
[10447.269720] uvcvideo: Dropping payload (out of sync).
[10447.269724] uvcvideo: Dropping payload (out of sync).
[10447.269729] uvcvideo: Dropping payload (out of sync).
[10447.269733] uvcvideo: Dropping payload (out of sync).
[10447.269738] uvcvideo: Dropping payload (out of sync).
[10447.269744] uvcvideo: Dropping payload (out of sync).
[10447.269750] uvcvideo: Dropping payload (out of sync).
[10447.269754] uvcvideo: Dropping payload (out of sync).
[10447.269758] uvcvideo: Dropping payload (out of sync).
[10447.269762] uvcvideo: Dropping payload (out of sync).
[10447.269765] uvcvideo: Dropping payload (out of sync).
[10447.269770] uvcvideo: Dropping payload (out of sync).
[10447.269774] uvcvideo: Dropping payload (out of sync).
[10447.269779] uvcvideo: Dropping payload (out of sync).
[10447.269787] uvcvideo: Dropping payload (out of sync).
[10447.269791] uvcvideo: Dropping payload (out of sync).
[10447.269797] uvcvideo: Dropping payload (out of sync).
[10447.269800] uvcvideo: Dropping payload (out of sync).
[10447.269810] uvcvideo: Dropping payload (out of sync).
[10447.270245] uvcvideo: uvc_v4l2_poll
[10447.273364] uvcvideo: Dropping payload (out of sync).
[10447.273365] uvcvideo: Dropping payload (out of sync).
[10447.273365] uvcvideo: Dropping payload (out of sync).
[10447.273368] uvcvideo: Dropping payload (out of sync).
[10447.273368] uvcvideo: Dropping payload (out of sync).
[10447.273369] uvcvideo: Dropping payload (out of sync).
[10447.273369] uvcvideo: Dropping payload (out of sync).
[10447.273370] uvcvideo: Dropping payload (out of sync).
[10447.273370] uvcvideo: Dropping payload (out of sync).
[10447.273371] uvcvideo: Dropping payload (out of sync).
[10447.273371] uvcvideo: Dropping payload (out of sync).
[10447.273374] uvcvideo: Dropping payload (out of sync).
[10447.273374] uvcvideo: Dropping payload (out of sync).
[10447.273375] uvcvideo: Dropping payload (out of sync).
[10447.273375] uvcvideo: Dropping payload (out of sync).
[10447.273376] uvcvideo: Dropping payload (out of sync).
[10447.273378] uvcvideo: frame 205632 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 334233064/334742540/1777
[10447.301367] uvcvideo: Frame complete (EOF found).
[10447.301380] uvcvideo: Dropping payload (out of sync).
[10447.301383] uvcvideo: Dropping payload (out of sync).
[10447.301385] uvcvideo: Dropping payload (out of sync).
[10447.301389] uvcvideo: Dropping payload (out of sync).
[10447.301396] uvcvideo: Dropping payload (out of sync).
[10447.301400] uvcvideo: Dropping payload (out of sync).
[10447.301603] uvcvideo: Dropping payload (out of sync).
[10447.301607] uvcvideo: Dropping payload (out of sync).
[10447.301612] uvcvideo: Dropping payload (out of sync).
[10447.301616] uvcvideo: Dropping payload (out of sync).
[10447.301621] uvcvideo: Dropping payload (out of sync).
[10447.301626] uvcvideo: Dropping payload (out of sync).
[10447.301634] uvcvideo: Dropping payload (out of sync).
[10447.301637] uvcvideo: Dropping payload (out of sync).
[10447.301642] uvcvideo: Dropping payload (out of sync).
[10447.301647] uvcvideo: Dropping payload (out of sync).
[10447.301833] uvcvideo: Dropping payload (out of sync).
[10447.301836] uvcvideo: Dropping payload (out of sync).
[10447.301839] uvcvideo: Dropping payload (out of sync).
[10447.301844] uvcvideo: Dropping payload (out of sync).
[10447.301851] uvcvideo: Dropping payload (out of sync).
[10447.301856] uvcvideo: Dropping payload (out of sync).
[10447.301860] uvcvideo: Dropping payload (out of sync).
[10447.301865] uvcvideo: Dropping payload (out of sync).
[10447.301870] uvcvideo: Dropping payload (out of sync).
[10447.301910] uvcvideo: uvc_v4l2_poll
[10447.305486] uvcvideo: Dropping payload (out of sync).
[10447.305490] uvcvideo: Dropping payload (out of sync).
[10447.305491] uvcvideo: Dropping payload (out of sync).
[10447.305494] uvcvideo: Dropping payload (out of sync).
[10447.305495] uvcvideo: Dropping payload (out of sync).
[10447.305496] uvcvideo: Dropping payload (out of sync).
[10447.305497] uvcvideo: Dropping payload (out of sync).
[10447.305498] uvcvideo: Dropping payload (out of sync).
[10447.305499] uvcvideo: Dropping payload (out of sync).
[10447.305500] uvcvideo: Dropping payload (out of sync).
[10447.305501] uvcvideo: Dropping payload (out of sync).
[10447.305503] uvcvideo: Dropping payload (out of sync).
[10447.305504] uvcvideo: Dropping payload (out of sync).
[10447.305505] uvcvideo: Dropping payload (out of sync).
[10447.305506] uvcvideo: Dropping payload (out of sync).
[10447.305507] uvcvideo: Dropping payload (out of sync).
[10447.305508] uvcvideo: Dropping payload (out of sync).
[10447.305509] uvcvideo: Dropping payload (out of sync).
[10447.305510] uvcvideo: Dropping payload (out of sync).
[10447.305691] uvcvideo: Dropping payload (out of sync).
[10447.305692] uvcvideo: Dropping payload (out of sync).
[10447.305693] uvcvideo: Dropping payload (out of sync).
[10447.305694] uvcvideo: Dropping payload (out of sync).
[10447.305695] uvcvideo: Dropping payload (out of sync).
[10447.305696] uvcvideo: Dropping payload (out of sync).
[10447.305697] uvcvideo: Dropping payload (out of sync).
[10447.305698] uvcvideo: Dropping payload (out of sync).
[10447.305702] uvcvideo: frame 205633 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 334733488/335243159/1810
[10447.306911] uvcvideo: uvc_v4l2_poll
[10447.333365] uvcvideo: Frame complete (EOF found).
[10447.333371] uvcvideo: Dropping payload (out of sync).
[10447.333375] uvcvideo: Dropping payload (out of sync).
[10447.333375] uvcvideo: Dropping payload (out of sync).
[10447.333376] uvcvideo: Dropping payload (out of sync).
[10447.333376] uvcvideo: Dropping payload (out of sync).
[10447.333377] uvcvideo: Dropping payload (out of sync).
[10447.333377] uvcvideo: Dropping payload (out of sync).
[10447.333378] uvcvideo: Dropping payload (out of sync).
[10447.333378] uvcvideo: Dropping payload (out of sync).
[10447.333381] uvcvideo: Dropping payload (out of sync).
[10447.333382] uvcvideo: Dropping payload (out of sync).
[10447.333382] uvcvideo: Dropping payload (out of sync).
[10447.333383] uvcvideo: Dropping payload (out of sync).
[10447.333383] uvcvideo: Dropping payload (out of sync).
[10447.333452] uvcvideo: uvc_v4l2_poll
[10447.337349] uvcvideo: Dropping payload (out of sync).
[10447.337351] uvcvideo: Dropping payload (out of sync).
[10447.337352] uvcvideo: Dropping payload (out of sync).
[10447.337356] uvcvideo: Dropping payload (out of sync).
[10447.337356] uvcvideo: Dropping payload (out of sync).
[10447.337356] uvcvideo: Dropping payload (out of sync).
[10447.337357] uvcvideo: Dropping payload (out of sync).
[10447.337357] uvcvideo: Dropping payload (out of sync).
[10447.337358] uvcvideo: Dropping payload (out of sync).
[10447.337358] uvcvideo: Dropping payload (out of sync).
[10447.337358] uvcvideo: Dropping payload (out of sync).
[10447.337361] uvcvideo: Dropping payload (out of sync).
[10447.337361] uvcvideo: Dropping payload (out of sync).
[10447.337362] uvcvideo: Dropping payload (out of sync).
[10447.337362] uvcvideo: Dropping payload (out of sync).
[10447.337362] uvcvideo: Dropping payload (out of sync).
[10447.337363] uvcvideo: Dropping payload (out of sync).
[10447.337363] uvcvideo: Dropping payload (out of sync).
[10447.337363] uvcvideo: Dropping payload (out of sync).
[10447.337366] uvcvideo: Dropping payload (out of sync).
[10447.337366] uvcvideo: Dropping payload (out of sync).
[10447.337367] uvcvideo: Dropping payload (out of sync).
[10447.337367] uvcvideo: Dropping payload (out of sync).
[10447.337367] uvcvideo: Dropping payload (out of sync).
[10447.337368] uvcvideo: Dropping payload (out of sync).
[10447.337368] uvcvideo: Dropping payload (out of sync).
[10447.337368] uvcvideo: Dropping payload (out of sync).
[10447.337371] uvcvideo: Dropping payload (out of sync).
[10447.337371] uvcvideo: Dropping payload (out of sync).
[10447.337372] uvcvideo: Dropping payload (out of sync).
[10447.337372] uvcvideo: Dropping payload (out of sync).
[10447.337372] uvcvideo: Dropping payload (out of sync).
[10447.338475] uvcvideo: uvc_v4l2_poll
[10447.341362] uvcvideo: Dropping payload (out of sync).
[10447.341417] uvcvideo: Dropping payload (out of sync).
[10447.341417] uvcvideo: Dropping payload (out of sync).
[10447.341426] uvcvideo: Dropping payload (out of sync).
[10447.341426] uvcvideo: Dropping payload (out of sync).
[10447.341432] uvcvideo: frame 205634 stats: 0/170/266 packets, 0/0/266 pts (!early initial), 265/266 scr, last pts/stc/sof 335233912/335741901/1844
[10447.365361] uvcvideo: Frame complete (EOF found).
[10447.365363] uvcvideo: Dropping payload (out of sync).
[10447.365364] uvcvideo: Dropping payload (out of sync).
[10447.365364] uvcvideo: Dropping payload (out of sync).
[10447.365365] uvcvideo: Dropping payload (out of sync).
[10447.365414] uvcvideo: uvc_v4l2_poll
[10447.369357] uvcvideo: Dropping payload (out of sync).
[10447.369368] uvcvideo: Dropping payload (out of sync).
[10447.369371] uvcvideo: Dropping payload (out of sync).
[10447.369449] uvcvideo: Dropping payload (out of sync).
[10447.369456] uvcvideo: Dropping payload (out of sync).
[10447.369460] uvcvideo: Dropping payload (out of sync).
[10447.369530] uvcvideo: Dropping payload (out of sync).
[10447.369533] uvcvideo: Dropping payload (out of sync).
[10447.369535] uvcvideo: Dropping payload (out of sync).
[10447.369536] uvcvideo: Dropping payload (out of sync).
[10447.369538] uvcvideo: Dropping payload (out of sync).
[10447.369542] uvcvideo: Dropping payload (out of sync).
[10447.369543] uvcvideo: Dropping payload (out of sync).
[10447.369545] uvcvideo: Dropping payload (out of sync).
[10447.369546] uvcvideo: Dropping payload (out of sync).
[10447.369548] uvcvideo: Dropping payload (out of sync).
[10447.369549] uvcvideo: Dropping payload (out of sync).
[10447.369551] uvcvideo: Dropping payload (out of sync).
[10447.369552] uvcvideo: Dropping payload (out of sync).
[10447.369556] uvcvideo: Dropping payload (out of sync).
[10447.369558] uvcvideo: Dropping payload (out of sync).
[10447.369559] uvcvideo: Dropping payload (out of sync).
[10447.369561] uvcvideo: Dropping payload (out of sync).
[10447.369563] uvcvideo: Dropping payload (out of sync).
[10447.369565] uvcvideo: Dropping payload (out of sync).
[10447.369566] uvcvideo: Dropping payload (out of sync).
[10447.369568] uvcvideo: Dropping payload (out of sync).
[10447.369572] uvcvideo: Dropping payload (out of sync).
[10447.369574] uvcvideo: Dropping payload (out of sync).
[10447.369578] uvcvideo: Dropping payload (out of sync).
[10447.369579] uvcvideo: Dropping payload (out of sync).
[10447.369581] uvcvideo: Dropping payload (out of sync).
[10447.369616] uvcvideo: uvc_v4l2_poll
[10447.373368] uvcvideo: Dropping payload (out of sync).
[10447.373370] uvcvideo: Dropping payload (out of sync).
[10447.373370] uvcvideo: Dropping payload (out of sync).
[10447.373374] uvcvideo: Dropping payload (out of sync).
[10447.373374] uvcvideo: Dropping payload (out of sync).
[10447.373374] uvcvideo: Dropping payload (out of sync).
[10447.373375] uvcvideo: Dropping payload (out of sync).
[10447.373376] uvcvideo: Dropping payload (out of sync).
[10447.373376] uvcvideo: Dropping payload (out of sync).
[10447.373377] uvcvideo: Dropping payload (out of sync).
[10447.373377] uvcvideo: Dropping payload (out of sync).
[10447.373380] uvcvideo: Dropping payload (out of sync).
[10447.373380] uvcvideo: Dropping payload (out of sync).
[10447.373381] uvcvideo: Dropping payload (out of sync).
[10447.373381] uvcvideo: Dropping payload (out of sync).
[10447.373382] uvcvideo: Dropping payload (out of sync).
[10447.373385] uvcvideo: frame 205635 stats: 0/170/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 335734335/336242519/1877
[10447.401352] uvcvideo: Frame complete (EOF found).
[10447.401364] uvcvideo: Dropping payload (out of sync).
[10447.401367] uvcvideo: Dropping payload (out of sync).
[10447.401374] uvcvideo: Dropping payload (out of sync).
[10447.401448] uvcvideo: Dropping payload (out of sync).
[10447.401456] uvcvideo: Dropping payload (out of sync).
[10447.401459] uvcvideo: Dropping payload (out of sync).
[10447.401463] uvcvideo: Dropping payload (out of sync).
[10447.401466] uvcvideo: Dropping payload (out of sync).
[10447.401469] uvcvideo: Dropping payload (out of sync).
[10447.401474] uvcvideo: Dropping payload (out of sync).
[10447.401479] uvcvideo: Dropping payload (out of sync).
[10447.401484] uvcvideo: Dropping payload (out of sync).
[10447.401554] uvcvideo: Dropping payload (out of sync).
[10447.401561] uvcvideo: Dropping payload (out of sync).
[10447.401566] uvcvideo: Dropping payload (out of sync).
[10447.401571] uvcvideo: Dropping payload (out of sync).
[10447.401575] uvcvideo: Dropping payload (out of sync).
[10447.401580] uvcvideo: Dropping payload (out of sync).
[10447.401585] uvcvideo: Dropping payload (out of sync).
[10447.401589] uvcvideo: Dropping payload (out of sync).
[10447.401596] uvcvideo: Dropping payload (out of sync).
[10447.401601] uvcvideo: Dropping payload (out of sync).
[10447.401606] uvcvideo: Dropping payload (out of sync).
[10447.401610] uvcvideo: Dropping payload (out of sync).
[10447.401615] uvcvideo: Dropping payload (out of sync).
[10447.401659] uvcvideo: uvc_v4l2_poll
[10447.405382] uvcvideo: Dropping payload (out of sync).
[10447.405384] uvcvideo: Dropping payload (out of sync).
[10447.405385] uvcvideo: Dropping payload (out of sync).
[10447.405388] uvcvideo: Dropping payload (out of sync).
[10447.405389] uvcvideo: Dropping payload (out of sync).
[10447.405442] uvcvideo: Dropping payload (out of sync).
[10447.405443] uvcvideo: Dropping payload (out of sync).
[10447.405443] uvcvideo: Dropping payload (out of sync).
[10447.405444] uvcvideo: Dropping payload (out of sync).
[10447.405445] uvcvideo: Dropping payload (out of sync).
[10447.405445] uvcvideo: Dropping payload (out of sync).
[10447.405455] uvcvideo: Dropping payload (out of sync).
[10447.405455] uvcvideo: Dropping payload (out of sync).
[10447.405456] uvcvideo: Dropping payload (out of sync).
[10447.405456] uvcvideo: Dropping payload (out of sync).
[10447.405457] uvcvideo: Dropping payload (out of sync).
[10447.405460] uvcvideo: Dropping payload (out of sync).
[10447.405461] uvcvideo: Dropping payload (out of sync).
[10447.405461] uvcvideo: Dropping payload (out of sync).
[10447.405464] uvcvideo: Dropping payload (out of sync).
[10447.405465] uvcvideo: Dropping payload (out of sync).
[10447.405466] uvcvideo: Dropping payload (out of sync).
[10447.405466] uvcvideo: Dropping payload (out of sync).
[10447.405467] uvcvideo: Dropping payload (out of sync).
[10447.405467] uvcvideo: Dropping payload (out of sync).
[10447.405468] uvcvideo: Dropping payload (out of sync).
[10447.405468] uvcvideo: Dropping payload (out of sync).
[10447.405471] uvcvideo: frame 205636 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 336234759/336743136/1910
[10447.406409] uvcvideo: uvc_v4l2_poll
[10447.433359] uvcvideo: Frame complete (EOF found).
[10447.433362] uvcvideo: Dropping payload (out of sync).
[10447.433366] uvcvideo: Dropping payload (out of sync).
[10447.433367] uvcvideo: Dropping payload (out of sync).
[10447.433367] uvcvideo: Dropping payload (out of sync).
[10447.433368] uvcvideo: Dropping payload (out of sync).
[10447.433369] uvcvideo: Dropping payload (out of sync).
[10447.433370] uvcvideo: Dropping payload (out of sync).
[10447.433371] uvcvideo: Dropping payload (out of sync).
[10447.433372] uvcvideo: Dropping payload (out of sync).
[10447.433376] uvcvideo: Dropping payload (out of sync).
[10447.433377] uvcvideo: Dropping payload (out of sync).
[10447.433377] uvcvideo: Dropping payload (out of sync).
[10447.433378] uvcvideo: Dropping payload (out of sync).
[10447.433379] uvcvideo: Dropping payload (out of sync).
[10447.433422] uvcvideo: uvc_v4l2_poll
[10447.435690] uvcvideo: uvc_v4l2_poll
[10447.437353] uvcvideo: Dropping payload (out of sync).
[10447.437494] uvcvideo: Dropping payload (out of sync).
[10447.437499] uvcvideo: Dropping payload (out of sync).
[10447.437507] uvcvideo: Dropping payload (out of sync).
[10447.437510] uvcvideo: Dropping payload (out of sync).
[10447.437515] uvcvideo: Dropping payload (out of sync).
[10447.437519] uvcvideo: Dropping payload (out of sync).
[10447.437522] uvcvideo: Dropping payload (out of sync).
[10447.437526] uvcvideo: Dropping payload (out of sync).
[10447.437529] uvcvideo: Dropping payload (out of sync).
[10447.437533] uvcvideo: Dropping payload (out of sync).
[10447.437539] uvcvideo: Dropping payload (out of sync).
[10447.437544] uvcvideo: Dropping payload (out of sync).
[10447.437676] uvcvideo: Dropping payload (out of sync).
[10447.437680] uvcvideo: Dropping payload (out of sync).
[10447.437687] uvcvideo: Dropping payload (out of sync).
[10447.437821] uvcvideo: Dropping payload (out of sync).
[10447.437832] uvcvideo: Dropping payload (out of sync).
[10447.437836] uvcvideo: Dropping payload (out of sync).
[10447.437844] uvcvideo: Dropping payload (out of sync).
[10447.437849] uvcvideo: Dropping payload (out of sync).
[10447.437854] uvcvideo: Dropping payload (out of sync).
[10447.437858] uvcvideo: Dropping payload (out of sync).
[10447.437863] uvcvideo: Dropping payload (out of sync).
[10447.437868] uvcvideo: Dropping payload (out of sync).
[10447.437872] uvcvideo: Dropping payload (out of sync).
[10447.437877] uvcvideo: Dropping payload (out of sync).
[10447.437886] uvcvideo: Dropping payload (out of sync).
[10447.437891] uvcvideo: Dropping payload (out of sync).
[10447.437896] uvcvideo: Dropping payload (out of sync).
[10447.437900] uvcvideo: Dropping payload (out of sync).
[10447.437905] uvcvideo: Dropping payload (out of sync).
[10447.441371] uvcvideo: Dropping payload (out of sync).
[10447.441374] uvcvideo: Dropping payload (out of sync).
[10447.441374] uvcvideo: Dropping payload (out of sync).
[10447.441378] uvcvideo: Dropping payload (out of sync).
[10447.441379] uvcvideo: Dropping payload (out of sync).
[10447.441379] uvcvideo: Dropping payload (out of sync).
[10447.441438] uvcvideo: frame 205637 stats: 0/166/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 336735182/337243753/1944
[10447.465362] uvcvideo: Frame complete (EOF found).
[10447.465365] uvcvideo: Dropping payload (out of sync).
[10447.465366] uvcvideo: Dropping payload (out of sync).
[10447.465367] uvcvideo: Dropping payload (out of sync).
[10447.465391] uvcvideo: uvc_v4l2_poll
[10447.469356] uvcvideo: Dropping payload (out of sync).
[10447.469359] uvcvideo: Dropping payload (out of sync).
[10447.469360] uvcvideo: Dropping payload (out of sync).
[10447.469364] uvcvideo: Dropping payload (out of sync).
[10447.469365] uvcvideo: Dropping payload (out of sync).
[10447.469366] uvcvideo: Dropping payload (out of sync).
[10447.469367] uvcvideo: Dropping payload (out of sync).
[10447.469368] uvcvideo: Dropping payload (out of sync).
[10447.469369] uvcvideo: Dropping payload (out of sync).
[10447.469370] uvcvideo: Dropping payload (out of sync).
[10447.469371] uvcvideo: Dropping payload (out of sync).
[10447.469374] uvcvideo: Dropping payload (out of sync).
[10447.469375] uvcvideo: Dropping payload (out of sync).
[10447.469375] uvcvideo: Dropping payload (out of sync).
[10447.469376] uvcvideo: Dropping payload (out of sync).
[10447.469377] uvcvideo: Dropping payload (out of sync).
[10447.469378] uvcvideo: Dropping payload (out of sync).
[10447.469379] uvcvideo: Dropping payload (out of sync).
[10447.469380] uvcvideo: Dropping payload (out of sync).
[10447.469383] uvcvideo: Dropping payload (out of sync).
[10447.469384] uvcvideo: Dropping payload (out of sync).
[10447.469385] uvcvideo: Dropping payload (out of sync).
[10447.469386] uvcvideo: Dropping payload (out of sync).
[10447.469386] uvcvideo: Dropping payload (out of sync).
[10447.469387] uvcvideo: Dropping payload (out of sync).
[10447.469389] uvcvideo: uvc_v4l2_poll
[10447.469391] uvcvideo: Dropping payload (out of sync).
[10447.469392] uvcvideo: Dropping payload (out of sync).
[10447.469394] uvcvideo: Dropping payload (out of sync).
[10447.469395] uvcvideo: Dropping payload (out of sync).
[10447.469396] uvcvideo: Dropping payload (out of sync).
[10447.469397] uvcvideo: Dropping payload (out of sync).
[10447.469398] uvcvideo: Dropping payload (out of sync).
[10447.473410] uvcvideo: Dropping payload (out of sync).
[10447.473418] uvcvideo: Dropping payload (out of sync).
[10447.473421] uvcvideo: Dropping payload (out of sync).
[10447.473428] uvcvideo: Dropping payload (out of sync).
[10447.473430] uvcvideo: Dropping payload (out of sync).
[10447.473436] uvcvideo: Dropping payload (out of sync).
[10447.473439] uvcvideo: Dropping payload (out of sync).
[10447.473442] uvcvideo: Dropping payload (out of sync).
[10447.473445] uvcvideo: Dropping payload (out of sync).
[10447.473448] uvcvideo: Dropping payload (out of sync).
[10447.473453] uvcvideo: Dropping payload (out of sync).
[10447.473460] uvcvideo: Dropping payload (out of sync).
[10447.473462] uvcvideo: Dropping payload (out of sync).
[10447.473465] uvcvideo: Dropping payload (out of sync).
[10447.473468] uvcvideo: Dropping payload (out of sync).
[10447.473471] uvcvideo: Dropping payload (out of sync).
[10447.473474] uvcvideo: Dropping payload (out of sync).
[10447.473480] uvcvideo: frame 205638 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 337235605/337744371/1977
[10447.501350] uvcvideo: Frame complete (EOF found).
[10447.501354] uvcvideo: Dropping payload (out of sync).
[10447.501355] uvcvideo: Dropping payload (out of sync).
[10447.501356] uvcvideo: Dropping payload (out of sync).
[10447.501359] uvcvideo: Dropping payload (out of sync).
[10447.501360] uvcvideo: Dropping payload (out of sync).
[10447.501361] uvcvideo: Dropping payload (out of sync).
[10447.501362] uvcvideo: Dropping payload (out of sync).
[10447.501363] uvcvideo: Dropping payload (out of sync).
[10447.501364] uvcvideo: Dropping payload (out of sync).
[10447.501365] uvcvideo: Dropping payload (out of sync).
[10447.501366] uvcvideo: Dropping payload (out of sync).
[10447.501369] uvcvideo: Dropping payload (out of sync).
[10447.501370] uvcvideo: Dropping payload (out of sync).
[10447.501371] uvcvideo: Dropping payload (out of sync).
[10447.501372] uvcvideo: Dropping payload (out of sync).
[10447.501372] uvcvideo: Dropping payload (out of sync).
[10447.501373] uvcvideo: Dropping payload (out of sync).
[10447.501374] uvcvideo: Dropping payload (out of sync).
[10447.501375] uvcvideo: Dropping payload (out of sync).
[10447.501378] uvcvideo: Dropping payload (out of sync).
[10447.501379] uvcvideo: Dropping payload (out of sync).
[10447.501380] uvcvideo: Dropping payload (out of sync).
[10447.501381] uvcvideo: Dropping payload (out of sync).
[10447.501382] uvcvideo: Dropping payload (out of sync).
[10447.501414] uvcvideo: uvc_v4l2_poll
[10447.505370] uvcvideo: Dropping payload (out of sync).
[10447.505374] uvcvideo: Dropping payload (out of sync).
[10447.505376] uvcvideo: Dropping payload (out of sync).
[10447.505380] uvcvideo: Dropping payload (out of sync).
[10447.505381] uvcvideo: Dropping payload (out of sync).
[10447.505382] uvcvideo: Dropping payload (out of sync).
[10447.505384] uvcvideo: Dropping payload (out of sync).
[10447.505385] uvcvideo: Dropping payload (out of sync).
[10447.505386] uvcvideo: Dropping payload (out of sync).
[10447.505387] uvcvideo: Dropping payload (out of sync).
[10447.505388] uvcvideo: Dropping payload (out of sync).
[10447.505393] uvcvideo: Dropping payload (out of sync).
[10447.505394] uvcvideo: Dropping payload (out of sync).
[10447.505395] uvcvideo: Dropping payload (out of sync).
[10447.505397] uvcvideo: Dropping payload (out of sync).
[10447.505398] uvcvideo: Dropping payload (out of sync).
[10447.505399] uvcvideo: Dropping payload (out of sync).
[10447.505401] uvcvideo: Dropping payload (out of sync).
[10447.505402] uvcvideo: Dropping payload (out of sync).
[10447.505405] uvcvideo: Dropping payload (out of sync).
[10447.505406] uvcvideo: Dropping payload (out of sync).
[10447.505407] uvcvideo: Dropping payload (out of sync).
[10447.505408] uvcvideo: Dropping payload (out of sync).
[10447.505409] uvcvideo: Dropping payload (out of sync).
[10447.505411] uvcvideo: Dropping payload (out of sync).
[10447.505412] uvcvideo: Dropping payload (out of sync).
[10447.505413] uvcvideo: Dropping payload (out of sync).
[10447.505417] uvcvideo: Dropping payload (out of sync).
[10447.505423] uvcvideo: frame 205639 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 337736029/338244988/2011
[10447.506686] uvcvideo: uvc_v4l2_poll
[10447.533372] uvcvideo: Frame complete (EOF found).
[10447.533413] uvcvideo: Dropping payload (out of sync).
[10447.533589] uvcvideo: Dropping payload (out of sync).
[10447.533594] uvcvideo: Dropping payload (out of sync).
[10447.533599] uvcvideo: Dropping payload (out of sync).
[10447.533604] uvcvideo: Dropping payload (out of sync).
[10447.533609] uvcvideo: Dropping payload (out of sync).
[10447.533613] uvcvideo: Dropping payload (out of sync).
[10447.533618] uvcvideo: Dropping payload (out of sync).
[10447.533626] uvcvideo: Dropping payload (out of sync).
[10447.533630] uvcvideo: Dropping payload (out of sync).
[10447.533635] uvcvideo: Dropping payload (out of sync).
[10447.533639] uvcvideo: Dropping payload (out of sync).
[10447.533644] uvcvideo: Dropping payload (out of sync).
[10447.533877] uvcvideo: uvc_v4l2_poll
[10447.537436] uvcvideo: Dropping payload (out of sync).
[10447.537453] uvcvideo: Dropping payload (out of sync).
[10447.537458] uvcvideo: Dropping payload (out of sync).
[10447.537638] uvcvideo: Dropping payload (out of sync).
[10447.537643] uvcvideo: Dropping payload (out of sync).
[10447.537650] uvcvideo: Dropping payload (out of sync).
[10447.537656] uvcvideo: Dropping payload (out of sync).
[10447.537661] uvcvideo: Dropping payload (out of sync).
[10447.537666] uvcvideo: Dropping payload (out of sync).
[10447.537671] uvcvideo: Dropping payload (out of sync).
[10447.537676] uvcvideo: Dropping payload (out of sync).
[10447.537684] uvcvideo: Dropping payload (out of sync).
[10447.537690] uvcvideo: Dropping payload (out of sync).
[10447.537695] uvcvideo: Dropping payload (out of sync).
[10447.537701] uvcvideo: Dropping payload (out of sync).
[10447.537706] uvcvideo: Dropping payload (out of sync).
[10447.537711] uvcvideo: Dropping payload (out of sync).
[10447.537718] uvcvideo: Dropping payload (out of sync).
[10447.537724] uvcvideo: Dropping payload (out of sync).
[10447.537894] uvcvideo: Dropping payload (out of sync).
[10447.537901] uvcvideo: Dropping payload (out of sync).
[10447.537908] uvcvideo: Dropping payload (out of sync).
[10447.537914] uvcvideo: Dropping payload (out of sync).
[10447.537925] uvcvideo: Dropping payload (out of sync).
[10447.537932] uvcvideo: Dropping payload (out of sync).
[10447.537937] uvcvideo: Dropping payload (out of sync).
[10447.538109] uvcvideo: Dropping payload (out of sync).
[10447.538116] uvcvideo: Dropping payload (out of sync).
[10447.538119] uvcvideo: Dropping payload (out of sync).
[10447.538123] uvcvideo: Dropping payload (out of sync).
[10447.538126] uvcvideo: Dropping payload (out of sync).
[10447.538129] uvcvideo: Dropping payload (out of sync).
[10447.538372] uvcvideo: uvc_v4l2_poll
[10447.541459] uvcvideo: Dropping payload (out of sync).
[10447.541462] uvcvideo: Dropping payload (out of sync).
[10447.541464] uvcvideo: Dropping payload (out of sync).
[10447.541469] uvcvideo: Dropping payload (out of sync).
[10447.541470] uvcvideo: Dropping payload (out of sync).
[10447.541472] uvcvideo: Dropping payload (out of sync).
[10447.541473] uvcvideo: Dropping payload (out of sync).
[10447.541480] uvcvideo: frame 205640 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 338236452/338745607/2044
[10447.565372] uvcvideo: Frame complete (EOF found).
[10447.565393] uvcvideo: Dropping payload (out of sync).
[10447.565399] uvcvideo: Dropping payload (out of sync).
[10447.565550] uvcvideo: uvc_v4l2_poll
[10447.569364] uvcvideo: Dropping payload (out of sync).
[10447.569376] uvcvideo: Dropping payload (out of sync).
[10447.569393] uvcvideo: Dropping payload (out of sync).
[10447.569570] uvcvideo: Dropping payload (out of sync).
[10447.569574] uvcvideo: Dropping payload (out of sync).
[10447.569577] uvcvideo: Dropping payload (out of sync).
[10447.569580] uvcvideo: Dropping payload (out of sync).
[10447.569583] uvcvideo: Dropping payload (out of sync).
[10447.569586] uvcvideo: Dropping payload (out of sync).
[10447.569589] uvcvideo: Dropping payload (out of sync).
[10447.569592] uvcvideo: Dropping payload (out of sync).
[10447.569598] uvcvideo: Dropping payload (out of sync).
[10447.569602] uvcvideo: Dropping payload (out of sync).
[10447.569605] uvcvideo: Dropping payload (out of sync).
[10447.569609] uvcvideo: Dropping payload (out of sync).
[10447.569612] uvcvideo: Dropping payload (out of sync).
[10447.569615] uvcvideo: Dropping payload (out of sync).
[10447.569618] uvcvideo: Dropping payload (out of sync).
[10447.569621] uvcvideo: Dropping payload (out of sync).
[10447.569793] uvcvideo: Dropping payload (out of sync).
[10447.569797] uvcvideo: Dropping payload (out of sync).
[10447.569801] uvcvideo: Dropping payload (out of sync).
[10447.569804] uvcvideo: Dropping payload (out of sync).
[10447.569807] uvcvideo: Dropping payload (out of sync).
[10447.569811] uvcvideo: Dropping payload (out of sync).
[10447.569814] uvcvideo: Dropping payload (out of sync).
[10447.569817] uvcvideo: Dropping payload (out of sync).
[10447.569823] uvcvideo: Dropping payload (out of sync).
[10447.569826] uvcvideo: Dropping payload (out of sync).
[10447.569829] uvcvideo: Dropping payload (out of sync).
[10447.569833] uvcvideo: Dropping payload (out of sync).
[10447.569836] uvcvideo: Dropping payload (out of sync).
[10447.570681] uvcvideo: uvc_v4l2_poll
[10447.573396] uvcvideo: Dropping payload (out of sync).
[10447.573397] uvcvideo: Dropping payload (out of sync).
[10447.573398] uvcvideo: Dropping payload (out of sync).
[10447.573401] uvcvideo: Dropping payload (out of sync).
[10447.573402] uvcvideo: Dropping payload (out of sync).
[10447.573402] uvcvideo: Dropping payload (out of sync).
[10447.573403] uvcvideo: Dropping payload (out of sync).
[10447.573403] uvcvideo: Dropping payload (out of sync).
[10447.573404] uvcvideo: Dropping payload (out of sync).
[10447.573404] uvcvideo: Dropping payload (out of sync).
[10447.573405] uvcvideo: Dropping payload (out of sync).
[10447.573407] uvcvideo: Dropping payload (out of sync).
[10447.573408] uvcvideo: Dropping payload (out of sync).
[10447.573409] uvcvideo: Dropping payload (out of sync).
[10447.573409] uvcvideo: Dropping payload (out of sync).
[10447.573409] uvcvideo: Dropping payload (out of sync).
[10447.573412] uvcvideo: Dropping payload (out of sync).
[10447.573412] uvcvideo: Dropping payload (out of sync).
[10447.573417] uvcvideo: frame 205641 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 338736876/339246226/29
[10447.601371] uvcvideo: Frame complete (EOF found).
[10447.601389] uvcvideo: Dropping payload (out of sync).
[10447.601395] uvcvideo: Dropping payload (out of sync).
[10447.601403] uvcvideo: Dropping payload (out of sync).
[10447.601578] uvcvideo: Dropping payload (out of sync).
[10447.601584] uvcvideo: Dropping payload (out of sync).
[10447.601588] uvcvideo: Dropping payload (out of sync).
[10447.601593] uvcvideo: Dropping payload (out of sync).
[10447.601598] uvcvideo: Dropping payload (out of sync).
[10447.601602] uvcvideo: Dropping payload (out of sync).
[10447.601607] uvcvideo: Dropping payload (out of sync).
[10447.601615] uvcvideo: Dropping payload (out of sync).
[10447.601620] uvcvideo: Dropping payload (out of sync).
[10447.601625] uvcvideo: Dropping payload (out of sync).
[10447.601806] uvcvideo: Dropping payload (out of sync).
[10447.601813] uvcvideo: Dropping payload (out of sync).
[10447.601822] uvcvideo: Dropping payload (out of sync).
[10447.601830] uvcvideo: Dropping payload (out of sync).
[10447.601834] uvcvideo: Dropping payload (out of sync).
[10447.601842] uvcvideo: Dropping payload (out of sync).
[10447.601847] uvcvideo: Dropping payload (out of sync).
[10447.601852] uvcvideo: Dropping payload (out of sync).
[10447.601856] uvcvideo: Dropping payload (out of sync).
[10447.601861] uvcvideo: Dropping payload (out of sync).
[10447.601907] uvcvideo: uvc_v4l2_poll
[10447.605385] uvcvideo: Dropping payload (out of sync).
[10447.605396] uvcvideo: Dropping payload (out of sync).
[10447.605401] uvcvideo: Dropping payload (out of sync).
[10447.605409] uvcvideo: Dropping payload (out of sync).
[10447.605414] uvcvideo: Dropping payload (out of sync).
[10447.605419] uvcvideo: Dropping payload (out of sync).
[10447.605423] uvcvideo: Dropping payload (out of sync).
[10447.605428] uvcvideo: Dropping payload (out of sync).
[10447.605433] uvcvideo: Dropping payload (out of sync).
[10447.605437] uvcvideo: Dropping payload (out of sync).
[10447.605443] uvcvideo: Dropping payload (out of sync).
[10447.605452] uvcvideo: Dropping payload (out of sync).
[10447.605457] uvcvideo: Dropping payload (out of sync).
[10447.605465] uvcvideo: Dropping payload (out of sync).
[10447.605469] uvcvideo: Dropping payload (out of sync).
[10447.605474] uvcvideo: Dropping payload (out of sync).
[10447.605480] uvcvideo: Dropping payload (out of sync).
[10447.605619] uvcvideo: Dropping payload (out of sync).
[10447.605627] uvcvideo: Dropping payload (out of sync).
[10447.605766] uvcvideo: Dropping payload (out of sync).
[10447.605775] uvcvideo: Dropping payload (out of sync).
[10447.605780] uvcvideo: Dropping payload (out of sync).
[10447.605785] uvcvideo: Dropping payload (out of sync).
[10447.605790] uvcvideo: Dropping payload (out of sync).
[10447.605797] uvcvideo: Dropping payload (out of sync).
[10447.605802] uvcvideo: Dropping payload (out of sync).
[10447.605807] uvcvideo: Dropping payload (out of sync).
[10447.605813] uvcvideo: Dropping payload (out of sync).
[10447.605819] uvcvideo: Dropping payload (out of sync).
[10447.605830] uvcvideo: frame 205642 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 339237299/339746844/63
[10447.606186] uvcvideo: uvc_v4l2_poll
[10447.633361] uvcvideo: Frame complete (EOF found).
[10447.633378] uvcvideo: Dropping payload (out of sync).
[10447.633384] uvcvideo: Dropping payload (out of sync).
[10447.633539] uvcvideo: Dropping payload (out of sync).
[10447.633548] uvcvideo: Dropping payload (out of sync).
[10447.633555] uvcvideo: Dropping payload (out of sync).
[10447.633562] uvcvideo: Dropping payload (out of sync).
[10447.633566] uvcvideo: Dropping payload (out of sync).
[10447.633726] uvcvideo: Dropping payload (out of sync).
[10447.633731] uvcvideo: Dropping payload (out of sync).
[10447.633735] uvcvideo: Dropping payload (out of sync).
[10447.633740] uvcvideo: Dropping payload (out of sync).
[10447.633744] uvcvideo: Dropping payload (out of sync).
[10447.633782] uvcvideo: uvc_v4l2_poll
[10447.636327] uvcvideo: uvc_v4l2_poll
[10447.637469] uvcvideo: Dropping payload (out of sync).
[10447.637479] uvcvideo: Dropping payload (out of sync).
[10447.637485] uvcvideo: Dropping payload (out of sync).
[10447.637641] uvcvideo: Dropping payload (out of sync).
[10447.637651] uvcvideo: Dropping payload (out of sync).
[10447.637656] uvcvideo: Dropping payload (out of sync).
[10447.637660] uvcvideo: Dropping payload (out of sync).
[10447.637665] uvcvideo: Dropping payload (out of sync).
[10447.637670] uvcvideo: Dropping payload (out of sync).
[10447.637676] uvcvideo: Dropping payload (out of sync).
[10447.637681] uvcvideo: Dropping payload (out of sync).
[10447.637688] uvcvideo: Dropping payload (out of sync).
[10447.637696] uvcvideo: Dropping payload (out of sync).
[10447.637701] uvcvideo: Dropping payload (out of sync).
[10447.637706] uvcvideo: Dropping payload (out of sync).
[10447.637710] uvcvideo: Dropping payload (out of sync).
[10447.637715] uvcvideo: Dropping payload (out of sync).
[10447.637720] uvcvideo: Dropping payload (out of sync).
[10447.637724] uvcvideo: Dropping payload (out of sync).
[10447.637882] uvcvideo: Dropping payload (out of sync).
[10447.637902] uvcvideo: Dropping payload (out of sync).
[10447.637906] uvcvideo: Dropping payload (out of sync).
[10447.637911] uvcvideo: Dropping payload (out of sync).
[10447.637915] uvcvideo: Dropping payload (out of sync).
[10447.637918] uvcvideo: Dropping payload (out of sync).
[10447.638075] uvcvideo: Dropping payload (out of sync).
[10447.638078] uvcvideo: Dropping payload (out of sync).
[10447.638085] uvcvideo: Dropping payload (out of sync).
[10447.638088] uvcvideo: Dropping payload (out of sync).
[10447.638091] uvcvideo: Dropping payload (out of sync).
[10447.638094] uvcvideo: Dropping payload (out of sync).
[10447.638097] uvcvideo: Dropping payload (out of sync).
[10447.641430] uvcvideo: Dropping payload (out of sync).
[10447.641433] uvcvideo: Dropping payload (out of sync).
[10447.641435] uvcvideo: Dropping payload (out of sync).
[10447.641440] uvcvideo: Dropping payload (out of sync).
[10447.641441] uvcvideo: Dropping payload (out of sync).
[10447.641442] uvcvideo: Dropping payload (out of sync).
[10447.641444] uvcvideo: Dropping payload (out of sync).
[10447.641445] uvcvideo: Dropping payload (out of sync).
[10447.641450] uvcvideo: frame 205643 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 339737722/340247463/96
[10447.665367] uvcvideo: Frame complete (EOF found).
[10447.665384] uvcvideo: Dropping payload (out of sync).
[10447.665389] uvcvideo: Dropping payload (out of sync).
[10447.665527] uvcvideo: uvc_v4l2_poll
[10447.669353] uvcvideo: Dropping payload (out of sync).
[10447.669365] uvcvideo: Dropping payload (out of sync).
[10447.669371] uvcvideo: Dropping payload (out of sync).
[10447.669525] uvcvideo: Dropping payload (out of sync).
[10447.669531] uvcvideo: Dropping payload (out of sync).
[10447.669537] uvcvideo: Dropping payload (out of sync).
[10447.669542] uvcvideo: Dropping payload (out of sync).
[10447.669685] uvcvideo: Dropping payload (out of sync).
[10447.669689] uvcvideo: Dropping payload (out of sync).
[10447.669694] uvcvideo: Dropping payload (out of sync).
[10447.669699] uvcvideo: Dropping payload (out of sync).
[10447.669706] uvcvideo: Dropping payload (out of sync).
[10447.669711] uvcvideo: Dropping payload (out of sync).
[10447.669717] uvcvideo: Dropping payload (out of sync).
[10447.669722] uvcvideo: Dropping payload (out of sync).
[10447.669728] uvcvideo: Dropping payload (out of sync).
[10447.669733] uvcvideo: Dropping payload (out of sync).
[10447.669740] uvcvideo: Dropping payload (out of sync).
[10447.669745] uvcvideo: Dropping payload (out of sync).
[10447.669753] uvcvideo: Dropping payload (out of sync).
[10447.669759] uvcvideo: Dropping payload (out of sync).
[10447.669763] uvcvideo: Dropping payload (out of sync).
[10447.669768] uvcvideo: Dropping payload (out of sync).
[10447.669775] uvcvideo: Dropping payload (out of sync).
[10447.669780] uvcvideo: Dropping payload (out of sync).
[10447.669784] uvcvideo: Dropping payload (out of sync).
[10447.669788] uvcvideo: Dropping payload (out of sync).
[10447.669796] uvcvideo: Dropping payload (out of sync).
[10447.669800] uvcvideo: Dropping payload (out of sync).
[10447.669807] uvcvideo: Dropping payload (out of sync).
[10447.669812] uvcvideo: Dropping payload (out of sync).
[10447.669816] uvcvideo: Dropping payload (out of sync).
[10447.670340] uvcvideo: uvc_v4l2_poll
[10447.673420] uvcvideo: Dropping payload (out of sync).
[10447.673424] uvcvideo: Dropping payload (out of sync).
[10447.673425] uvcvideo: Dropping payload (out of sync).
[10447.673432] uvcvideo: Dropping payload (out of sync).
[10447.673433] uvcvideo: Dropping payload (out of sync).
[10447.673435] uvcvideo: Dropping payload (out of sync).
[10447.673436] uvcvideo: Dropping payload (out of sync).
[10447.673573] uvcvideo: Dropping payload (out of sync).
[10447.673575] uvcvideo: Dropping payload (out of sync).
[10447.673576] uvcvideo: Dropping payload (out of sync).
[10447.673577] uvcvideo: Dropping payload (out of sync).
[10447.673590] uvcvideo: Dropping payload (out of sync).
[10447.673592] uvcvideo: Dropping payload (out of sync).
[10447.673593] uvcvideo: Dropping payload (out of sync).
[10447.673594] uvcvideo: Dropping payload (out of sync).
[10447.673595] uvcvideo: Dropping payload (out of sync).
[10447.673598] uvcvideo: Dropping payload (out of sync).
[10447.673599] uvcvideo: Dropping payload (out of sync).
[10447.673604] uvcvideo: frame 205644 stats: 0/168/266 packets, 0/0/266 pts (!early initial), 265/266 scr, last pts/stc/sof 340238146/340746206/129
[10447.701361] uvcvideo: Frame complete (EOF found).
[10447.701375] uvcvideo: Dropping payload (out of sync).
[10447.701383] uvcvideo: Dropping payload (out of sync).
[10447.701390] uvcvideo: Dropping payload (out of sync).
[10447.701540] uvcvideo: Dropping payload (out of sync).
[10447.701547] uvcvideo: Dropping payload (out of sync).
[10447.701552] uvcvideo: Dropping payload (out of sync).
[10447.701557] uvcvideo: Dropping payload (out of sync).
[10447.701698] uvcvideo: Dropping payload (out of sync).
[10447.701707] uvcvideo: Dropping payload (out of sync).
[10447.701712] uvcvideo: Dropping payload (out of sync).
[10447.701719] uvcvideo: Dropping payload (out of sync).
[10447.701724] uvcvideo: Dropping payload (out of sync).
[10447.701728] uvcvideo: Dropping payload (out of sync).
[10447.701733] uvcvideo: Dropping payload (out of sync).
[10447.701738] uvcvideo: Dropping payload (out of sync).
[10447.701742] uvcvideo: Dropping payload (out of sync).
[10447.701747] uvcvideo: Dropping payload (out of sync).
[10447.701754] uvcvideo: Dropping payload (out of sync).
[10447.701762] uvcvideo: Dropping payload (out of sync).
[10447.701767] uvcvideo: Dropping payload (out of sync).
[10447.701771] uvcvideo: Dropping payload (out of sync).
[10447.701777] uvcvideo: Dropping payload (out of sync).
[10447.701783] uvcvideo: Dropping payload (out of sync).
[10447.701838] uvcvideo: uvc_v4l2_poll
[10447.705361] uvcvideo: Dropping payload (out of sync).
[10447.705371] uvcvideo: Dropping payload (out of sync).
[10447.705375] uvcvideo: Dropping payload (out of sync).
[10447.705523] uvcvideo: Dropping payload (out of sync).
[10447.705530] uvcvideo: Dropping payload (out of sync).
[10447.705668] uvcvideo: Dropping payload (out of sync).
[10447.705678] uvcvideo: Dropping payload (out of sync).
[10447.705682] uvcvideo: Dropping payload (out of sync).
[10447.705687] uvcvideo: Dropping payload (out of sync).
[10447.705692] uvcvideo: Dropping payload (out of sync).
[10447.705701] uvcvideo: Dropping payload (out of sync).
[10447.705709] uvcvideo: Dropping payload (out of sync).
[10447.705714] uvcvideo: Dropping payload (out of sync).
[10447.705719] uvcvideo: Dropping payload (out of sync).
[10447.705725] uvcvideo: Dropping payload (out of sync).
[10447.705729] uvcvideo: Dropping payload (out of sync).
[10447.705734] uvcvideo: Dropping payload (out of sync).
[10447.705739] uvcvideo: Dropping payload (out of sync).
[10447.705744] uvcvideo: Dropping payload (out of sync).
[10447.705753] uvcvideo: Dropping payload (out of sync).
[10447.705898] uvcvideo: Dropping payload (out of sync).
[10447.705904] uvcvideo: Dropping payload (out of sync).
[10447.705908] uvcvideo: Dropping payload (out of sync).
[10447.705913] uvcvideo: Dropping payload (out of sync).
[10447.705921] uvcvideo: Dropping payload (out of sync).
[10447.706060] uvcvideo: Dropping payload (out of sync).
[10447.706066] uvcvideo: Dropping payload (out of sync).
[10447.706073] uvcvideo: Dropping payload (out of sync).
[10447.706078] uvcvideo: Dropping payload (out of sync).
[10447.706088] uvcvideo: frame 205645 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 340738569/341246823/163
[10447.706550] uvcvideo: uvc_v4l2_poll
[10447.733363] uvcvideo: Frame complete (EOF found).
[10447.733376] uvcvideo: Dropping payload (out of sync).
[10447.733381] uvcvideo: Dropping payload (out of sync).
[10447.733533] uvcvideo: Dropping payload (out of sync).
[10447.733540] uvcvideo: Dropping payload (out of sync).
[10447.733546] uvcvideo: Dropping payload (out of sync).
[10447.733550] uvcvideo: Dropping payload (out of sync).
[10447.733709] uvcvideo: Dropping payload (out of sync).
[10447.733717] uvcvideo: Dropping payload (out of sync).
[10447.733722] uvcvideo: Dropping payload (out of sync).
[10447.733727] uvcvideo: Dropping payload (out of sync).
[10447.733732] uvcvideo: Dropping payload (out of sync).
[10447.733738] uvcvideo: Dropping payload (out of sync).
[10447.733792] uvcvideo: uvc_v4l2_poll
[10447.737486] uvcvideo: Dropping payload (out of sync).
[10447.737500] uvcvideo: Dropping payload (out of sync).
[10447.737507] uvcvideo: Dropping payload (out of sync).
[10447.737648] uvcvideo: Dropping payload (out of sync).
[10447.737653] uvcvideo: Dropping payload (out of sync).
[10447.737658] uvcvideo: Dropping payload (out of sync).
[10447.737664] uvcvideo: Dropping payload (out of sync).
[10447.737669] uvcvideo: Dropping payload (out of sync).
[10447.737674] uvcvideo: Dropping payload (out of sync).
[10447.737678] uvcvideo: Dropping payload (out of sync).
[10447.737683] uvcvideo: Dropping payload (out of sync).
[10447.737692] uvcvideo: Dropping payload (out of sync).
[10447.737698] uvcvideo: Dropping payload (out of sync).
[10447.737704] uvcvideo: Dropping payload (out of sync).
[10447.737707] uvcvideo: Dropping payload (out of sync).
[10447.737712] uvcvideo: Dropping payload (out of sync).
[10447.737718] uvcvideo: Dropping payload (out of sync).
[10447.737722] uvcvideo: Dropping payload (out of sync).
[10447.737725] uvcvideo: Dropping payload (out of sync).
[10447.737732] uvcvideo: Dropping payload (out of sync).
[10447.737737] uvcvideo: Dropping payload (out of sync).
[10447.737742] uvcvideo: Dropping payload (out of sync).
[10447.737746] uvcvideo: Dropping payload (out of sync).
[10447.737751] uvcvideo: Dropping payload (out of sync).
[10447.737756] uvcvideo: Dropping payload (out of sync).
[10447.737763] uvcvideo: Dropping payload (out of sync).
[10447.737767] uvcvideo: Dropping payload (out of sync).
[10447.737910] uvcvideo: Dropping payload (out of sync).
[10447.737943] uvcvideo: Dropping payload (out of sync).
[10447.738088] uvcvideo: Dropping payload (out of sync).
[10447.738092] uvcvideo: Dropping payload (out of sync).
[10447.738095] uvcvideo: Dropping payload (out of sync).
[10447.738328] uvcvideo: uvc_v4l2_poll
[10447.741358] uvcvideo: Dropping payload (out of sync).
[10447.741361] uvcvideo: Dropping payload (out of sync).
[10447.741364] uvcvideo: Dropping payload (out of sync).
[10447.741368] uvcvideo: Dropping payload (out of sync).
[10447.741370] uvcvideo: Dropping payload (out of sync).
[10447.741371] uvcvideo: Dropping payload (out of sync).
[10447.741511] uvcvideo: Dropping payload (out of sync).
[10447.741513] uvcvideo: Dropping payload (out of sync).
[10447.741518] uvcvideo: frame 205646 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 341238993/341747440/196
[10447.765366] uvcvideo: Frame complete (EOF found).
[10447.765383] uvcvideo: Dropping payload (out of sync).
[10447.765536] uvcvideo: uvc_v4l2_poll
[10447.769350] uvcvideo: Dropping payload (out of sync).
[10447.769364] uvcvideo: Dropping payload (out of sync).
[10447.769505] uvcvideo: Dropping payload (out of sync).
[10447.769515] uvcvideo: Dropping payload (out of sync).
[10447.769519] uvcvideo: Dropping payload (out of sync).
[10447.769526] uvcvideo: Dropping payload (out of sync).
[10447.769667] uvcvideo: Dropping payload (out of sync).
[10447.769672] uvcvideo: Dropping payload (out of sync).
[10447.769677] uvcvideo: Dropping payload (out of sync).
[10447.769681] uvcvideo: Dropping payload (out of sync).
[10447.769686] uvcvideo: Dropping payload (out of sync).
[10447.769694] uvcvideo: Dropping payload (out of sync).
[10447.769699] uvcvideo: Dropping payload (out of sync).
[10447.769706] uvcvideo: Dropping payload (out of sync).
[10447.769711] uvcvideo: Dropping payload (out of sync).
[10447.769715] uvcvideo: Dropping payload (out of sync).
[10447.769724] uvcvideo: Dropping payload (out of sync).
[10447.769730] uvcvideo: Dropping payload (out of sync).
[10447.769734] uvcvideo: Dropping payload (out of sync).
[10447.769740] uvcvideo: Dropping payload (out of sync).
[10447.769746] uvcvideo: Dropping payload (out of sync).
[10447.769750] uvcvideo: Dropping payload (out of sync).
[10447.769753] uvcvideo: Dropping payload (out of sync).
[10447.769756] uvcvideo: Dropping payload (out of sync).
[10447.769760] uvcvideo: Dropping payload (out of sync).
[10447.769763] uvcvideo: Dropping payload (out of sync).
[10447.769767] uvcvideo: Dropping payload (out of sync).
[10447.769771] uvcvideo: Dropping payload (out of sync).
[10447.769775] uvcvideo: Dropping payload (out of sync).
[10447.769778] uvcvideo: Dropping payload (out of sync).
[10447.769920] uvcvideo: Dropping payload (out of sync).
[10447.769922] uvcvideo: uvc_v4l2_poll
[10447.769928] uvcvideo: Dropping payload (out of sync).
[10447.773369] uvcvideo: Dropping payload (out of sync).
[10447.773372] uvcvideo: Dropping payload (out of sync).
[10447.773374] uvcvideo: Dropping payload (out of sync).
[10447.773378] uvcvideo: Dropping payload (out of sync).
[10447.773380] uvcvideo: Dropping payload (out of sync).
[10447.773382] uvcvideo: Dropping payload (out of sync).
[10447.773384] uvcvideo: Dropping payload (out of sync).
[10447.773385] uvcvideo: Dropping payload (out of sync).
[10447.773386] uvcvideo: Dropping payload (out of sync).
[10447.773388] uvcvideo: Dropping payload (out of sync).
[10447.773543] uvcvideo: Dropping payload (out of sync).
[10447.773552] uvcvideo: Dropping payload (out of sync).
[10447.773554] uvcvideo: Dropping payload (out of sync).
[10447.773557] uvcvideo: Dropping payload (out of sync).
[10447.773558] uvcvideo: Dropping payload (out of sync).
[10447.773562] uvcvideo: Dropping payload (out of sync).
[10447.773563] uvcvideo: Dropping payload (out of sync).
[10447.773564] uvcvideo: Dropping payload (out of sync).
[10447.773566] uvcvideo: Dropping payload (out of sync).
[10447.773725] uvcvideo: frame 205647 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 341739416/342248059/229
[10447.801356] uvcvideo: Frame complete (EOF found).
[10447.801370] uvcvideo: Dropping payload (out of sync).
[10447.801378] uvcvideo: Dropping payload (out of sync).
[10447.801382] uvcvideo: Dropping payload (out of sync).
[10447.801531] uvcvideo: Dropping payload (out of sync).
[10447.801537] uvcvideo: Dropping payload (out of sync).
[10447.801544] uvcvideo: Dropping payload (out of sync).
[10447.801695] uvcvideo: Dropping payload (out of sync).
[10447.801699] uvcvideo: Dropping payload (out of sync).
[10447.801705] uvcvideo: Dropping payload (out of sync).
[10447.801713] uvcvideo: Dropping payload (out of sync).
[10447.801718] uvcvideo: Dropping payload (out of sync).
[10447.801723] uvcvideo: Dropping payload (out of sync).
[10447.801729] uvcvideo: Dropping payload (out of sync).
[10447.801735] uvcvideo: Dropping payload (out of sync).
[10447.801740] uvcvideo: Dropping payload (out of sync).
[10447.801744] uvcvideo: Dropping payload (out of sync).
[10447.801751] uvcvideo: Dropping payload (out of sync).
[10447.801759] uvcvideo: Dropping payload (out of sync).
[10447.801764] uvcvideo: Dropping payload (out of sync).
[10447.801769] uvcvideo: Dropping payload (out of sync).
[10447.801774] uvcvideo: Dropping payload (out of sync).
[10447.801779] uvcvideo: Dropping payload (out of sync).
[10447.801948] uvcvideo: uvc_v4l2_poll
[10447.805404] uvcvideo: Dropping payload (out of sync).
[10447.805418] uvcvideo: Dropping payload (out of sync).
[10447.805424] uvcvideo: Dropping payload (out of sync).
[10447.805566] uvcvideo: Dropping payload (out of sync).
[10447.805576] uvcvideo: Dropping payload (out of sync).
[10447.805581] uvcvideo: Dropping payload (out of sync).
[10447.805585] uvcvideo: Dropping payload (out of sync).
[10447.805591] uvcvideo: Dropping payload (out of sync).
[10447.805597] uvcvideo: Dropping payload (out of sync).
[10447.805602] uvcvideo: Dropping payload (out of sync).
[10447.805606] uvcvideo: Dropping payload (out of sync).
[10447.805616] uvcvideo: Dropping payload (out of sync).
[10447.805621] uvcvideo: Dropping payload (out of sync).
[10447.805626] uvcvideo: Dropping payload (out of sync).
[10447.805630] uvcvideo: Dropping payload (out of sync).
[10447.805638] uvcvideo: Dropping payload (out of sync).
[10447.805782] uvcvideo: Dropping payload (out of sync).
[10447.805787] uvcvideo: Dropping payload (out of sync).
[10447.805794] uvcvideo: Dropping payload (out of sync).
[10447.805802] uvcvideo: Dropping payload (out of sync).
[10447.805807] uvcvideo: Dropping payload (out of sync).
[10447.805812] uvcvideo: Dropping payload (out of sync).
[10447.805817] uvcvideo: Dropping payload (out of sync).
[10447.805960] uvcvideo: Dropping payload (out of sync).
[10447.805963] uvcvideo: Dropping payload (out of sync).
[10447.805966] uvcvideo: Dropping payload (out of sync).
[10447.805969] uvcvideo: Dropping payload (out of sync).
[10447.805974] uvcvideo: Dropping payload (out of sync).
[10447.805977] uvcvideo: Dropping payload (out of sync).
[10447.805980] uvcvideo: Dropping payload (out of sync).
[10447.805987] uvcvideo: frame 205648 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 342239839/342748677/263
[10447.806363] uvcvideo: uvc_v4l2_poll
[10447.833360] uvcvideo: Frame complete (EOF found).
[10447.833363] uvcvideo: Dropping payload (out of sync).
[10447.833365] uvcvideo: Dropping payload (out of sync).
[10447.833366] uvcvideo: Dropping payload (out of sync).
[10447.833367] uvcvideo: Dropping payload (out of sync).
[10447.833367] uvcvideo: Dropping payload (out of sync).
[10447.833368] uvcvideo: Dropping payload (out of sync).
[10447.833372] uvcvideo: Dropping payload (out of sync).
[10447.833372] uvcvideo: Dropping payload (out of sync).
[10447.833373] uvcvideo: Dropping payload (out of sync).
[10447.833374] uvcvideo: Dropping payload (out of sync).
[10447.833375] uvcvideo: Dropping payload (out of sync).
[10447.833408] uvcvideo: uvc_v4l2_poll
[10447.837362] uvcvideo: Dropping payload (out of sync).
[10447.837370] uvcvideo: Dropping payload (out of sync).
[10447.837374] uvcvideo: Dropping payload (out of sync).
[10447.837387] uvcvideo: Dropping payload (out of sync).
[10447.837392] uvcvideo: Dropping payload (out of sync).
[10447.837396] uvcvideo: Dropping payload (out of sync).
[10447.837401] uvcvideo: Dropping payload (out of sync).
[10447.837406] uvcvideo: Dropping payload (out of sync).
[10447.837410] uvcvideo: Dropping payload (out of sync).
[10447.837415] uvcvideo: Dropping payload (out of sync).
[10447.837420] uvcvideo: Dropping payload (out of sync).
[10447.837588] uvcvideo: Dropping payload (out of sync).
[10447.837594] uvcvideo: Dropping payload (out of sync).
[10447.837756] uvcvideo: Dropping payload (out of sync).
[10447.837761] uvcvideo: Dropping payload (out of sync).
[10447.837766] uvcvideo: Dropping payload (out of sync).
[10447.837770] uvcvideo: Dropping payload (out of sync).
[10447.837777] uvcvideo: Dropping payload (out of sync).
[10447.837782] uvcvideo: Dropping payload (out of sync).
[10447.837789] uvcvideo: Dropping payload (out of sync).
[10447.837795] uvcvideo: Dropping payload (out of sync).
[10447.837800] uvcvideo: Dropping payload (out of sync).
[10447.837806] uvcvideo: Dropping payload (out of sync).
[10447.837809] uvcvideo: Dropping payload (out of sync).
[10447.837820] uvcvideo: Dropping payload (out of sync).
[10447.837826] uvcvideo: Dropping payload (out of sync).
[10447.837831] uvcvideo: Dropping payload (out of sync).
[10447.837841] uvcvideo: Dropping payload (out of sync).
[10447.837846] uvcvideo: Dropping payload (out of sync).
[10447.837850] uvcvideo: Dropping payload (out of sync).
[10447.837855] uvcvideo: Dropping payload (out of sync).
[10447.837863] uvcvideo: Dropping payload (out of sync).
[10447.838221] uvcvideo: uvc_v4l2_poll
[10447.841366] uvcvideo: Dropping payload (out of sync).
[10447.841369] uvcvideo: Dropping payload (out of sync).
[10447.841371] uvcvideo: Dropping payload (out of sync).
[10447.841375] uvcvideo: Dropping payload (out of sync).
[10447.841376] uvcvideo: Dropping payload (out of sync).
[10447.841380] uvcvideo: Dropping payload (out of sync).
[10447.841381] uvcvideo: Dropping payload (out of sync).
[10447.841382] uvcvideo: Dropping payload (out of sync).
[10447.841384] uvcvideo: Dropping payload (out of sync).
[10447.841547] uvcvideo: frame 205649 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 342740263/343249295/296
[10447.865371] uvcvideo: Frame complete (EOF found).
[10447.865547] uvcvideo: uvc_v4l2_poll
[10447.869352] uvcvideo: Dropping payload (out of sync).
[10447.869364] uvcvideo: Dropping payload (out of sync).
[10447.869374] uvcvideo: Dropping payload (out of sync).
[10447.869518] uvcvideo: Dropping payload (out of sync).
[10447.869525] uvcvideo: Dropping payload (out of sync).
[10447.869528] uvcvideo: Dropping payload (out of sync).
[10447.869532] uvcvideo: Dropping payload (out of sync).
[10447.869673] uvcvideo: Dropping payload (out of sync).
[10447.869678] uvcvideo: Dropping payload (out of sync).
[10447.869682] uvcvideo: Dropping payload (out of sync).
[10447.869688] uvcvideo: Dropping payload (out of sync).
[10447.869695] uvcvideo: Dropping payload (out of sync).
[10447.869701] uvcvideo: Dropping payload (out of sync).
[10447.869706] uvcvideo: Dropping payload (out of sync).
[10447.869711] uvcvideo: Dropping payload (out of sync).
[10447.869716] uvcvideo: Dropping payload (out of sync).
[10447.869721] uvcvideo: Dropping payload (out of sync).
[10447.869728] uvcvideo: Dropping payload (out of sync).
[10447.869732] uvcvideo: Dropping payload (out of sync).
[10447.869740] uvcvideo: Dropping payload (out of sync).
[10447.869745] uvcvideo: Dropping payload (out of sync).
[10447.869751] uvcvideo: Dropping payload (out of sync).
[10447.869756] uvcvideo: Dropping payload (out of sync).
[10447.869761] uvcvideo: Dropping payload (out of sync).
[10447.869767] uvcvideo: Dropping payload (out of sync).
[10447.869771] uvcvideo: Dropping payload (out of sync).
[10447.869774] uvcvideo: Dropping payload (out of sync).
[10447.869781] uvcvideo: Dropping payload (out of sync).
[10447.869784] uvcvideo: Dropping payload (out of sync).
[10447.869788] uvcvideo: Dropping payload (out of sync).
[10447.869791] uvcvideo: Dropping payload (out of sync).
[10447.869795] uvcvideo: Dropping payload (out of sync).
[10447.869965] uvcvideo: uvc_v4l2_poll
[10447.873497] uvcvideo: Dropping payload (out of sync).
[10447.873502] uvcvideo: Dropping payload (out of sync).
[10447.873503] uvcvideo: Dropping payload (out of sync).
[10447.873512] uvcvideo: Dropping payload (out of sync).
[10447.873513] uvcvideo: Dropping payload (out of sync).
[10447.873515] uvcvideo: Dropping payload (out of sync).
[10447.873516] uvcvideo: Dropping payload (out of sync).
[10447.873517] uvcvideo: Dropping payload (out of sync).
[10447.873518] uvcvideo: Dropping payload (out of sync).
[10447.873519] uvcvideo: Dropping payload (out of sync).
[10447.873521] uvcvideo: Dropping payload (out of sync).
[10447.873523] uvcvideo: Dropping payload (out of sync).
[10447.873524] uvcvideo: Dropping payload (out of sync).
[10447.873526] uvcvideo: Dropping payload (out of sync).
[10447.873527] uvcvideo: Dropping payload (out of sync).
[10447.873529] uvcvideo: Dropping payload (out of sync).
[10447.873531] uvcvideo: Dropping payload (out of sync).
[10447.873532] uvcvideo: Dropping payload (out of sync).
[10447.873534] uvcvideo: Dropping payload (out of sync).
[10447.873537] uvcvideo: Dropping payload (out of sync).
[10447.873542] uvcvideo: frame 205650 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 343240687/343749913/330
[10447.901358] uvcvideo: Frame complete (EOF found).
[10447.901376] uvcvideo: Dropping payload (out of sync).
[10447.901380] uvcvideo: Dropping payload (out of sync).
[10447.901385] uvcvideo: Dropping payload (out of sync).
[10447.901527] uvcvideo: Dropping payload (out of sync).
[10447.901536] uvcvideo: Dropping payload (out of sync).
[10447.901540] uvcvideo: Dropping payload (out of sync).
[10447.901545] uvcvideo: Dropping payload (out of sync).
[10447.901549] uvcvideo: Dropping payload (out of sync).
[10447.901557] uvcvideo: Dropping payload (out of sync).
[10447.901562] uvcvideo: Dropping payload (out of sync).
[10447.901710] uvcvideo: Dropping payload (out of sync).
[10447.901714] uvcvideo: Dropping payload (out of sync).
[10447.901719] uvcvideo: Dropping payload (out of sync).
[10447.901724] uvcvideo: Dropping payload (out of sync).
[10447.901728] uvcvideo: Dropping payload (out of sync).
[10447.901733] uvcvideo: Dropping payload (out of sync).
[10447.901741] uvcvideo: Dropping payload (out of sync).
[10447.901746] uvcvideo: Dropping payload (out of sync).
[10447.901751] uvcvideo: Dropping payload (out of sync).
[10447.901755] uvcvideo: Dropping payload (out of sync).
[10447.901760] uvcvideo: Dropping payload (out of sync).
[10447.901809] uvcvideo: uvc_v4l2_poll
[10447.905373] uvcvideo: Dropping payload (out of sync).
[10447.905380] uvcvideo: Dropping payload (out of sync).
[10447.905385] uvcvideo: Dropping payload (out of sync).
[10447.905396] uvcvideo: Dropping payload (out of sync).
[10447.905401] uvcvideo: Dropping payload (out of sync).
[10447.905406] uvcvideo: Dropping payload (out of sync).
[10447.905411] uvcvideo: Dropping payload (out of sync).
[10447.905415] uvcvideo: Dropping payload (out of sync).
[10447.905420] uvcvideo: Dropping payload (out of sync).
[10447.905425] uvcvideo: Dropping payload (out of sync).
[10447.905429] uvcvideo: Dropping payload (out of sync).
[10447.905437] uvcvideo: Dropping payload (out of sync).
[10447.905576] uvcvideo: Dropping payload (out of sync).
[10447.905587] uvcvideo: Dropping payload (out of sync).
[10447.905594] uvcvideo: Dropping payload (out of sync).
[10447.905733] uvcvideo: Dropping payload (out of sync).
[10447.905738] uvcvideo: Dropping payload (out of sync).
[10447.905743] uvcvideo: Dropping payload (out of sync).
[10447.905748] uvcvideo: Dropping payload (out of sync).
[10447.905756] uvcvideo: Dropping payload (out of sync).
[10447.905760] uvcvideo: Dropping payload (out of sync).
[10447.905764] uvcvideo: Dropping payload (out of sync).
[10447.905770] uvcvideo: Dropping payload (out of sync).
[10447.905778] uvcvideo: Dropping payload (out of sync).
[10447.905783] uvcvideo: Dropping payload (out of sync).
[10447.905788] uvcvideo: Dropping payload (out of sync).
[10447.905791] uvcvideo: Dropping payload (out of sync).
[10447.905798] uvcvideo: Dropping payload (out of sync).
[10447.905801] uvcvideo: Dropping payload (out of sync).
[10447.905805] uvcvideo: Dropping payload (out of sync).
[10447.905810] uvcvideo: Dropping payload (out of sync).
[10447.905821] uvcvideo: frame 205651 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 343741110/344250532/363
[10447.906192] uvcvideo: uvc_v4l2_poll
[10447.933368] uvcvideo: Frame complete (EOF found).
[10447.933384] uvcvideo: Dropping payload (out of sync).
[10447.933389] uvcvideo: Dropping payload (out of sync).
[10447.933393] uvcvideo: Dropping payload (out of sync).
[10447.933537] uvcvideo: Dropping payload (out of sync).
[10447.933546] uvcvideo: Dropping payload (out of sync).
[10447.933554] uvcvideo: Dropping payload (out of sync).
[10447.933560] uvcvideo: Dropping payload (out of sync).
[10447.933565] uvcvideo: Dropping payload (out of sync).
[10447.933570] uvcvideo: Dropping payload (out of sync).
[10447.933575] uvcvideo: Dropping payload (out of sync).
[10447.933726] uvcvideo: uvc_v4l2_poll
[10447.937482] uvcvideo: Dropping payload (out of sync).
[10447.937491] uvcvideo: Dropping payload (out of sync).
[10447.937498] uvcvideo: Dropping payload (out of sync).
[10447.937635] uvcvideo: Dropping payload (out of sync).
[10447.937640] uvcvideo: Dropping payload (out of sync).
[10447.937645] uvcvideo: Dropping payload (out of sync).
[10447.937650] uvcvideo: Dropping payload (out of sync).
[10447.937655] uvcvideo: Dropping payload (out of sync).
[10447.937659] uvcvideo: Dropping payload (out of sync).
[10447.937666] uvcvideo: Dropping payload (out of sync).
[10447.937671] uvcvideo: Dropping payload (out of sync).
[10447.937679] uvcvideo: Dropping payload (out of sync).
[10447.937684] uvcvideo: Dropping payload (out of sync).
[10447.937690] uvcvideo: Dropping payload (out of sync).
[10447.937694] uvcvideo: Dropping payload (out of sync).
[10447.937699] uvcvideo: Dropping payload (out of sync).
[10447.937705] uvcvideo: Dropping payload (out of sync).
[10447.937710] uvcvideo: Dropping payload (out of sync).
[10447.937717] uvcvideo: Dropping payload (out of sync).
[10447.937856] uvcvideo: Dropping payload (out of sync).
[10447.937880] uvcvideo: Dropping payload (out of sync).
[10447.937884] uvcvideo: Dropping payload (out of sync).
[10447.937892] uvcvideo: Dropping payload (out of sync).
[10447.938031] uvcvideo: Dropping payload (out of sync).
[10447.938036] uvcvideo: Dropping payload (out of sync).
[10447.938041] uvcvideo: Dropping payload (out of sync).
[10447.938046] uvcvideo: Dropping payload (out of sync).
[10447.938053] uvcvideo: Dropping payload (out of sync).
[10447.938058] uvcvideo: Dropping payload (out of sync).
[10447.938063] uvcvideo: Dropping payload (out of sync).
[10447.938068] uvcvideo: Dropping payload (out of sync).
[10447.938072] uvcvideo: Dropping payload (out of sync).
[10447.938417] uvcvideo: uvc_v4l2_poll
[10447.941478] uvcvideo: Dropping payload (out of sync).
[10447.941482] uvcvideo: Dropping payload (out of sync).
[10447.941483] uvcvideo: Dropping payload (out of sync).
[10447.941490] uvcvideo: Dropping payload (out of sync).
[10447.941491] uvcvideo: Dropping payload (out of sync).
[10447.941493] uvcvideo: Dropping payload (out of sync).
[10447.941494] uvcvideo: Dropping payload (out of sync).
[10447.941631] uvcvideo: Dropping payload (out of sync).
[10447.941632] uvcvideo: Dropping payload (out of sync).
[10447.941633] uvcvideo: Dropping payload (out of sync).
[10447.941638] uvcvideo: frame 205652 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 344241534/344751148/396
[10447.969356] uvcvideo: Frame complete (EOF found).
[10447.969377] uvcvideo: Dropping payload (out of sync).
[10447.969381] uvcvideo: Dropping payload (out of sync).
[10447.969528] uvcvideo: Dropping payload (out of sync).
[10447.969538] uvcvideo: Dropping payload (out of sync).
[10447.969542] uvcvideo: Dropping payload (out of sync).
[10447.969547] uvcvideo: Dropping payload (out of sync).
[10447.969552] uvcvideo: Dropping payload (out of sync).
[10447.969556] uvcvideo: Dropping payload (out of sync).
[10447.969561] uvcvideo: Dropping payload (out of sync).
[10447.969568] uvcvideo: Dropping payload (out of sync).
[10447.969576] uvcvideo: Dropping payload (out of sync).
[10447.969581] uvcvideo: Dropping payload (out of sync).
[10447.969586] uvcvideo: Dropping payload (out of sync).
[10447.969729] uvcvideo: Dropping payload (out of sync).
[10447.969734] uvcvideo: Dropping payload (out of sync).
[10447.969738] uvcvideo: Dropping payload (out of sync).
[10447.969743] uvcvideo: Dropping payload (out of sync).
[10447.969748] uvcvideo: Dropping payload (out of sync).
[10447.969755] uvcvideo: Dropping payload (out of sync).
[10447.969760] uvcvideo: Dropping payload (out of sync).
[10447.969764] uvcvideo: Dropping payload (out of sync).
[10447.969769] uvcvideo: Dropping payload (out of sync).
[10447.969774] uvcvideo: Dropping payload (out of sync).
[10447.969779] uvcvideo: Dropping payload (out of sync).
[10447.969784] uvcvideo: Dropping payload (out of sync).
[10447.969789] uvcvideo: Dropping payload (out of sync).
[10447.969798] uvcvideo: Dropping payload (out of sync).
[10447.969801] uvcvideo: Dropping payload (out of sync).
[10447.969806] uvcvideo: Dropping payload (out of sync).
[10447.969811] uvcvideo: Dropping payload (out of sync).
[10447.969815] uvcvideo: Dropping payload (out of sync).
[10447.969867] uvcvideo: uvc_v4l2_poll
[10447.973378] uvcvideo: Dropping payload (out of sync).
[10447.973386] uvcvideo: Dropping payload (out of sync).
[10447.973391] uvcvideo: Dropping payload (out of sync).
[10447.973398] uvcvideo: Dropping payload (out of sync).
[10447.973403] uvcvideo: Dropping payload (out of sync).
[10447.973408] uvcvideo: Dropping payload (out of sync).
[10447.973413] uvcvideo: Dropping payload (out of sync).
[10447.973418] uvcvideo: Dropping payload (out of sync).
[10447.973424] uvcvideo: Dropping payload (out of sync).
[10447.973429] uvcvideo: Dropping payload (out of sync).
[10447.973434] uvcvideo: Dropping payload (out of sync).
[10447.973441] uvcvideo: Dropping payload (out of sync).
[10447.973446] uvcvideo: Dropping payload (out of sync).
[10447.973451] uvcvideo: Dropping payload (out of sync).
[10447.973456] uvcvideo: Dropping payload (out of sync).
[10447.973594] uvcvideo: Dropping payload (out of sync).
[10447.973602] uvcvideo: Dropping payload (out of sync).
[10447.973607] uvcvideo: Dropping payload (out of sync).
[10447.973746] uvcvideo: Dropping payload (out of sync).
[10447.973753] uvcvideo: Dropping payload (out of sync).
[10447.973763] uvcvideo: frame 205653 stats: 0/169/266 packets, 0/0/266 pts (!early initial), 265/266 scr, last pts/stc/sof 344741957/345249893/430
[10447.974327] uvcvideo: uvc_v4l2_poll
[10448.001357] uvcvideo: Frame complete (EOF found).
[10448.001374] uvcvideo: Dropping payload (out of sync).
[10448.001380] uvcvideo: Dropping payload (out of sync).
[10448.001529] uvcvideo: Dropping payload (out of sync).
[10448.001533] uvcvideo: Dropping payload (out of sync).
[10448.001538] uvcvideo: Dropping payload (out of sync).
[10448.001544] uvcvideo: Dropping payload (out of sync).
[10448.001548] uvcvideo: Dropping payload (out of sync).
[10448.001695] uvcvideo: Dropping payload (out of sync).
[10448.001712] uvcvideo: Dropping payload (out of sync).
[10448.001717] uvcvideo: Dropping payload (out of sync).
[10448.001722] uvcvideo: Dropping payload (out of sync).
[10448.001726] uvcvideo: Dropping payload (out of sync).
[10448.001731] uvcvideo: Dropping payload (out of sync).
[10448.001736] uvcvideo: Dropping payload (out of sync).
[10448.001740] uvcvideo: Dropping payload (out of sync).
[10448.001745] uvcvideo: Dropping payload (out of sync).
[10448.001753] uvcvideo: Dropping payload (out of sync).
[10448.001757] uvcvideo: Dropping payload (out of sync).
[10448.001762] uvcvideo: Dropping payload (out of sync).
[10448.001767] uvcvideo: Dropping payload (out of sync).
[10448.001772] uvcvideo: Dropping payload (out of sync).
[10448.001816] uvcvideo: uvc_v4l2_poll
[10448.005467] uvcvideo: Dropping payload (out of sync).
[10448.005475] uvcvideo: Dropping payload (out of sync).
[10448.005480] uvcvideo: Dropping payload (out of sync).
[10448.005488] uvcvideo: Dropping payload (out of sync).
[10448.005494] uvcvideo: Dropping payload (out of sync).
[10448.005499] uvcvideo: Dropping payload (out of sync).
[10448.005504] uvcvideo: Dropping payload (out of sync).
[10448.005509] uvcvideo: Dropping payload (out of sync).
[10448.005516] uvcvideo: Dropping payload (out of sync).
[10448.005520] uvcvideo: Dropping payload (out of sync).
[10448.005525] uvcvideo: Dropping payload (out of sync).
[10448.005533] uvcvideo: Dropping payload (out of sync).
[10448.005538] uvcvideo: Dropping payload (out of sync).
[10448.005542] uvcvideo: Dropping payload (out of sync).
[10448.005547] uvcvideo: Dropping payload (out of sync).
[10448.005690] uvcvideo: Dropping payload (out of sync).
[10448.005697] uvcvideo: Dropping payload (out of sync).
[10448.005837] uvcvideo: Dropping payload (out of sync).
[10448.005844] uvcvideo: Dropping payload (out of sync).
[10448.005853] uvcvideo: Dropping payload (out of sync).
[10448.005857] uvcvideo: Dropping payload (out of sync).
[10448.005864] uvcvideo: Dropping payload (out of sync).
[10448.005869] uvcvideo: Dropping payload (out of sync).
[10448.005873] uvcvideo: Dropping payload (out of sync).
[10448.005878] uvcvideo: Dropping payload (out of sync).
[10448.005883] uvcvideo: Dropping payload (out of sync).
[10448.005887] uvcvideo: Dropping payload (out of sync).
[10448.005895] uvcvideo: Dropping payload (out of sync).
[10448.005900] uvcvideo: Dropping payload (out of sync).
[10448.005905] uvcvideo: Dropping payload (out of sync).
[10448.005910] uvcvideo: Dropping payload (out of sync).
[10448.005919] uvcvideo: frame 205654 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 345242380/345750510/463
[10448.006842] uvcvideo: uvc_v4l2_poll
[10448.033362] uvcvideo: Frame complete (EOF found).
[10448.033378] uvcvideo: Dropping payload (out of sync).
[10448.033383] uvcvideo: Dropping payload (out of sync).
[10448.033545] uvcvideo: Dropping payload (out of sync).
[10448.033554] uvcvideo: Dropping payload (out of sync).
[10448.033559] uvcvideo: Dropping payload (out of sync).
[10448.033567] uvcvideo: Dropping payload (out of sync).
[10448.033730] uvcvideo: Dropping payload (out of sync).
[10448.033735] uvcvideo: Dropping payload (out of sync).
[10448.033740] uvcvideo: Dropping payload (out of sync).
[10448.033744] uvcvideo: Dropping payload (out of sync).
[10448.033789] uvcvideo: uvc_v4l2_poll
[10448.037358] uvcvideo: Dropping payload (out of sync).
[10448.037522] uvcvideo: Dropping payload (out of sync).
[10448.037531] uvcvideo: Dropping payload (out of sync).
[10448.037688] uvcvideo: Dropping payload (out of sync).
[10448.037697] uvcvideo: Dropping payload (out of sync).
[10448.037702] uvcvideo: Dropping payload (out of sync).
[10448.037708] uvcvideo: Dropping payload (out of sync).
[10448.037713] uvcvideo: Dropping payload (out of sync).
[10448.037717] uvcvideo: Dropping payload (out of sync).
[10448.037722] uvcvideo: Dropping payload (out of sync).
[10448.037727] uvcvideo: Dropping payload (out of sync).
[10448.037735] uvcvideo: Dropping payload (out of sync).
[10448.037742] uvcvideo: Dropping payload (out of sync).
[10448.037747] uvcvideo: Dropping payload (out of sync).
[10448.037751] uvcvideo: Dropping payload (out of sync).
[10448.037756] uvcvideo: Dropping payload (out of sync).
[10448.037761] uvcvideo: Dropping payload (out of sync).
[10448.037767] uvcvideo: Dropping payload (out of sync).
[10448.037773] uvcvideo: Dropping payload (out of sync).
[10448.037929] uvcvideo: Dropping payload (out of sync).
[10448.037951] uvcvideo: Dropping payload (out of sync).
[10448.037959] uvcvideo: Dropping payload (out of sync).
[10448.038116] uvcvideo: Dropping payload (out of sync).
[10448.038126] uvcvideo: Dropping payload (out of sync).
[10448.038130] uvcvideo: Dropping payload (out of sync).
[10448.038135] uvcvideo: Dropping payload (out of sync).
[10448.038139] uvcvideo: Dropping payload (out of sync).
[10448.038147] uvcvideo: Dropping payload (out of sync).
[10448.038154] uvcvideo: Dropping payload (out of sync).
[10448.038159] uvcvideo: Dropping payload (out of sync).
[10448.038164] uvcvideo: Dropping payload (out of sync).
[10448.038171] uvcvideo: Dropping payload (out of sync).
[10448.038924] uvcvideo: uvc_v4l2_poll
[10448.041376] uvcvideo: Dropping payload (out of sync).
[10448.041379] uvcvideo: Dropping payload (out of sync).
[10448.041381] uvcvideo: Dropping payload (out of sync).
[10448.041391] uvcvideo: Dropping payload (out of sync).
[10448.041392] uvcvideo: Dropping payload (out of sync).
[10448.041394] uvcvideo: Dropping payload (out of sync).
[10448.041395] uvcvideo: Dropping payload (out of sync).
[10448.041396] uvcvideo: Dropping payload (out of sync).
[10448.041398] uvcvideo: Dropping payload (out of sync).
[10448.041399] uvcvideo: Dropping payload (out of sync).
[10448.041405] uvcvideo: frame 205655 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 345742804/346251128/496
[10448.069353] uvcvideo: Frame complete (EOF found).
[10448.069370] uvcvideo: Dropping payload (out of sync).
[10448.069377] uvcvideo: Dropping payload (out of sync).
[10448.069522] uvcvideo: Dropping payload (out of sync).
[10448.069528] uvcvideo: Dropping payload (out of sync).
[10448.069535] uvcvideo: Dropping payload (out of sync).
[10448.069539] uvcvideo: Dropping payload (out of sync).
[10448.069679] uvcvideo: Dropping payload (out of sync).
[10448.069688] uvcvideo: Dropping payload (out of sync).
[10448.069692] uvcvideo: Dropping payload (out of sync).
[10448.069697] uvcvideo: Dropping payload (out of sync).
[10448.069707] uvcvideo: Dropping payload (out of sync).
[10448.069711] uvcvideo: Dropping payload (out of sync).
[10448.069716] uvcvideo: Dropping payload (out of sync).
[10448.069721] uvcvideo: Dropping payload (out of sync).
[10448.069727] uvcvideo: Dropping payload (out of sync).
[10448.069732] uvcvideo: Dropping payload (out of sync).
[10448.069739] uvcvideo: Dropping payload (out of sync).
[10448.069744] uvcvideo: Dropping payload (out of sync).
[10448.069751] uvcvideo: Dropping payload (out of sync).
[10448.069756] uvcvideo: Dropping payload (out of sync).
[10448.069761] uvcvideo: Dropping payload (out of sync).
[10448.069766] uvcvideo: Dropping payload (out of sync).
[10448.069770] uvcvideo: Dropping payload (out of sync).
[10448.069775] uvcvideo: Dropping payload (out of sync).
[10448.069780] uvcvideo: Dropping payload (out of sync).
[10448.069784] uvcvideo: Dropping payload (out of sync).
[10448.069793] uvcvideo: Dropping payload (out of sync).
[10448.069796] uvcvideo: Dropping payload (out of sync).
[10448.069803] uvcvideo: Dropping payload (out of sync).
[10448.069807] uvcvideo: Dropping payload (out of sync).
[10448.069810] uvcvideo: Dropping payload (out of sync).
[10448.069970] uvcvideo: uvc_v4l2_poll
[10448.073407] uvcvideo: Dropping payload (out of sync).
[10448.073421] uvcvideo: Dropping payload (out of sync).
[10448.073427] uvcvideo: Dropping payload (out of sync).
[10448.073565] uvcvideo: Dropping payload (out of sync).
[10448.073574] uvcvideo: Dropping payload (out of sync).
[10448.073579] uvcvideo: Dropping payload (out of sync).
[10448.073583] uvcvideo: Dropping payload (out of sync).
[10448.073589] uvcvideo: Dropping payload (out of sync).
[10448.073595] uvcvideo: Dropping payload (out of sync).
[10448.073601] uvcvideo: Dropping payload (out of sync).
[10448.073606] uvcvideo: Dropping payload (out of sync).
[10448.073613] uvcvideo: Dropping payload (out of sync).
[10448.073618] uvcvideo: Dropping payload (out of sync).
[10448.073623] uvcvideo: Dropping payload (out of sync).
[10448.073627] uvcvideo: Dropping payload (out of sync).
[10448.073632] uvcvideo: Dropping payload (out of sync).
[10448.073638] uvcvideo: Dropping payload (out of sync).
[10448.073775] uvcvideo: Dropping payload (out of sync).
[10448.073803] uvcvideo: Dropping payload (out of sync).
[10448.073944] uvcvideo: Dropping payload (out of sync).
[10448.073948] uvcvideo: Dropping payload (out of sync).
[10448.073954] uvcvideo: frame 205656 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 346243227/346751745/530
[10448.074442] uvcvideo: uvc_v4l2_poll
[10448.101360] uvcvideo: Frame complete (EOF found).
[10448.101377] uvcvideo: Dropping payload (out of sync).
[10448.101383] uvcvideo: Dropping payload (out of sync).
[10448.101521] uvcvideo: Dropping payload (out of sync).
[10448.101530] uvcvideo: Dropping payload (out of sync).
[10448.101537] uvcvideo: Dropping payload (out of sync).
[10448.101543] uvcvideo: Dropping payload (out of sync).
[10448.101687] uvcvideo: Dropping payload (out of sync).
[10448.101695] uvcvideo: Dropping payload (out of sync).
[10448.101700] uvcvideo: Dropping payload (out of sync).
[10448.101706] uvcvideo: Dropping payload (out of sync).
[10448.101711] uvcvideo: Dropping payload (out of sync).
[10448.101716] uvcvideo: Dropping payload (out of sync).
[10448.101720] uvcvideo: Dropping payload (out of sync).
[10448.101725] uvcvideo: Dropping payload (out of sync).
[10448.101732] uvcvideo: Dropping payload (out of sync).
[10448.101740] uvcvideo: Dropping payload (out of sync).
[10448.101747] uvcvideo: Dropping payload (out of sync).
[10448.101752] uvcvideo: Dropping payload (out of sync).
[10448.101756] uvcvideo: Dropping payload (out of sync).
[10448.101761] uvcvideo: Dropping payload (out of sync).
[10448.101925] uvcvideo: uvc_v4l2_poll
[10448.105448] uvcvideo: Dropping payload (out of sync).
[10448.105462] uvcvideo: Dropping payload (out of sync).
[10448.105469] uvcvideo: Dropping payload (out of sync).
[10448.105614] uvcvideo: Dropping payload (out of sync).
[10448.105623] uvcvideo: Dropping payload (out of sync).
[10448.105628] uvcvideo: Dropping payload (out of sync).
[10448.105633] uvcvideo: Dropping payload (out of sync).
[10448.105637] uvcvideo: Dropping payload (out of sync).
[10448.105643] uvcvideo: Dropping payload (out of sync).
[10448.105648] uvcvideo: Dropping payload (out of sync).
[10448.105653] uvcvideo: Dropping payload (out of sync).
[10448.105660] uvcvideo: Dropping payload (out of sync).
[10448.105665] uvcvideo: Dropping payload (out of sync).
[10448.105669] uvcvideo: Dropping payload (out of sync).
[10448.105674] uvcvideo: Dropping payload (out of sync).
[10448.105679] uvcvideo: Dropping payload (out of sync).
[10448.105684] uvcvideo: Dropping payload (out of sync).
[10448.105689] uvcvideo: Dropping payload (out of sync).
[10448.105694] uvcvideo: Dropping payload (out of sync).
[10448.105702] uvcvideo: Dropping payload (out of sync).
[10448.105708] uvcvideo: Dropping payload (out of sync).
[10448.105865] uvcvideo: Dropping payload (out of sync).
[10448.105869] uvcvideo: Dropping payload (out of sync).
[10448.105872] uvcvideo: Dropping payload (out of sync).
[10448.105876] uvcvideo: Dropping payload (out of sync).
[10448.106021] uvcvideo: Dropping payload (out of sync).
[10448.106026] uvcvideo: Dropping payload (out of sync).
[10448.106032] uvcvideo: Dropping payload (out of sync).
[10448.106037] uvcvideo: Dropping payload (out of sync).
[10448.106042] uvcvideo: Dropping payload (out of sync).
[10448.106047] uvcvideo: Dropping payload (out of sync).
[10448.106052] uvcvideo: Dropping payload (out of sync).
[10448.106253] uvcvideo: uvc_v4l2_poll
[10448.109391] uvcvideo: frame 205657 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 346743651/347252362/563
[10448.133360] uvcvideo: Frame complete (EOF found).
[10448.133371] uvcvideo: Dropping payload (out of sync).
[10448.133377] uvcvideo: Dropping payload (out of sync).
[10448.133444] uvcvideo: Dropping payload (out of sync).
[10448.133449] uvcvideo: Dropping payload (out of sync).
[10448.133456] uvcvideo: Dropping payload (out of sync).
[10448.133460] uvcvideo: Dropping payload (out of sync).
[10448.133464] uvcvideo: Dropping payload (out of sync).
[10448.133467] uvcvideo: Dropping payload (out of sync).
[10448.133471] uvcvideo: Dropping payload (out of sync).
[10448.133548] uvcvideo: uvc_v4l2_poll
[10448.137353] uvcvideo: Dropping payload (out of sync).
[10448.137361] uvcvideo: Dropping payload (out of sync).
[10448.137365] uvcvideo: Dropping payload (out of sync).
[10448.137436] uvcvideo: Dropping payload (out of sync).
[10448.137440] uvcvideo: Dropping payload (out of sync).
[10448.137509] uvcvideo: Dropping payload (out of sync).
[10448.137517] uvcvideo: Dropping payload (out of sync).
[10448.137522] uvcvideo: Dropping payload (out of sync).
[10448.137526] uvcvideo: Dropping payload (out of sync).
[10448.137531] uvcvideo: Dropping payload (out of sync).
[10448.137536] uvcvideo: Dropping payload (out of sync).
[10448.137544] uvcvideo: Dropping payload (out of sync).
[10448.137547] uvcvideo: Dropping payload (out of sync).
[10448.137552] uvcvideo: Dropping payload (out of sync).
[10448.137557] uvcvideo: Dropping payload (out of sync).
[10448.137561] uvcvideo: Dropping payload (out of sync).
[10448.137566] uvcvideo: Dropping payload (out of sync).
[10448.137571] uvcvideo: Dropping payload (out of sync).
[10448.137574] uvcvideo: Dropping payload (out of sync).
[10448.137641] uvcvideo: Dropping payload (out of sync).
[10448.137644] uvcvideo: Dropping payload (out of sync).
[10448.137648] uvcvideo: Dropping payload (out of sync).
[10448.137717] uvcvideo: Dropping payload (out of sync).
[10448.137720] uvcvideo: Dropping payload (out of sync).
[10448.137724] uvcvideo: Dropping payload (out of sync).
[10448.137729] uvcvideo: Dropping payload (out of sync).
[10448.137734] uvcvideo: Dropping payload (out of sync).
[10448.137742] uvcvideo: Dropping payload (out of sync).
[10448.137745] uvcvideo: Dropping payload (out of sync).
[10448.137749] uvcvideo: Dropping payload (out of sync).
[10448.137754] uvcvideo: Dropping payload (out of sync).
[10448.137758] uvcvideo: Dropping payload (out of sync).
[10448.138965] uvcvideo: uvc_v4l2_poll
[10448.141375] uvcvideo: Dropping payload (out of sync).
[10448.141380] uvcvideo: Dropping payload (out of sync).
[10448.141384] uvcvideo: Dropping payload (out of sync).
[10448.141456] uvcvideo: Dropping payload (out of sync).
[10448.141461] uvcvideo: Dropping payload (out of sync).
[10448.141466] uvcvideo: Dropping payload (out of sync).
[10448.141470] uvcvideo: Dropping payload (out of sync).
[10448.141475] uvcvideo: Dropping payload (out of sync).
[10448.141480] uvcvideo: Dropping payload (out of sync).
[10448.141485] uvcvideo: Dropping payload (out of sync).
[10448.141489] uvcvideo: Dropping payload (out of sync).
[10448.141496] uvcvideo: frame 205658 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 347244074/347752980/596
[10448.169350] uvcvideo: Frame complete (EOF found).
[10448.169353] uvcvideo: Dropping payload (out of sync).
[10448.169356] uvcvideo: Dropping payload (out of sync).
[10448.169356] uvcvideo: Dropping payload (out of sync).
[10448.169357] uvcvideo: Dropping payload (out of sync).
[10448.169357] uvcvideo: Dropping payload (out of sync).
[10448.169358] uvcvideo: Dropping payload (out of sync).
[10448.169358] uvcvideo: Dropping payload (out of sync).
[10448.169359] uvcvideo: Dropping payload (out of sync).
[10448.169359] uvcvideo: Dropping payload (out of sync).
[10448.169362] uvcvideo: Dropping payload (out of sync).
[10448.169362] uvcvideo: Dropping payload (out of sync).
[10448.169363] uvcvideo: Dropping payload (out of sync).
[10448.169363] uvcvideo: Dropping payload (out of sync).
[10448.169364] uvcvideo: Dropping payload (out of sync).
[10448.169364] uvcvideo: Dropping payload (out of sync).
[10448.169365] uvcvideo: Dropping payload (out of sync).
[10448.169365] uvcvideo: Dropping payload (out of sync).
[10448.169368] uvcvideo: Dropping payload (out of sync).
[10448.169368] uvcvideo: Dropping payload (out of sync).
[10448.169369] uvcvideo: Dropping payload (out of sync).
[10448.169369] uvcvideo: Dropping payload (out of sync).
[10448.169370] uvcvideo: Dropping payload (out of sync).
[10448.169370] uvcvideo: Dropping payload (out of sync).
[10448.169370] uvcvideo: Dropping payload (out of sync).
[10448.169371] uvcvideo: Dropping payload (out of sync).
[10448.169374] uvcvideo: Dropping payload (out of sync).
[10448.169374] uvcvideo: Dropping payload (out of sync).
[10448.169375] uvcvideo: Dropping payload (out of sync).
[10448.169375] uvcvideo: Dropping payload (out of sync).
[10448.169376] uvcvideo: Dropping payload (out of sync).
[10448.169394] uvcvideo: uvc_v4l2_poll
[10448.173416] uvcvideo: Dropping payload (out of sync).
[10448.173426] uvcvideo: Dropping payload (out of sync).
[10448.173430] uvcvideo: Dropping payload (out of sync).
[10448.173438] uvcvideo: Dropping payload (out of sync).
[10448.173441] uvcvideo: Dropping payload (out of sync).
[10448.173449] uvcvideo: Dropping payload (out of sync).
[10448.173452] uvcvideo: Dropping payload (out of sync).
[10448.173458] uvcvideo: Dropping payload (out of sync).
[10448.173463] uvcvideo: Dropping payload (out of sync).
[10448.173467] uvcvideo: Dropping payload (out of sync).
[10448.173472] uvcvideo: Dropping payload (out of sync).
[10448.173480] uvcvideo: Dropping payload (out of sync).
[10448.173554] uvcvideo: Dropping payload (out of sync).
[10448.173562] uvcvideo: Dropping payload (out of sync).
[10448.173568] uvcvideo: Dropping payload (out of sync).
[10448.173640] uvcvideo: Dropping payload (out of sync).
[10448.173647] uvcvideo: Dropping payload (out of sync).
[10448.173652] uvcvideo: Dropping payload (out of sync).
[10448.173656] uvcvideo: Dropping payload (out of sync).
[10448.173664] uvcvideo: Dropping payload (out of sync).
[10448.173668] uvcvideo: Dropping payload (out of sync).
[10448.173673] uvcvideo: Dropping payload (out of sync).
[10448.173680] uvcvideo: frame 205659 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 347744498/348253597/630
[10448.174436] uvcvideo: uvc_v4l2_poll
[10448.201360] uvcvideo: Frame complete (EOF found).
[10448.201371] uvcvideo: Dropping payload (out of sync).
[10448.201379] uvcvideo: Dropping payload (out of sync).
[10448.201460] uvcvideo: Dropping payload (out of sync).
[10448.201465] uvcvideo: Dropping payload (out of sync).
[10448.201469] uvcvideo: Dropping payload (out of sync).
[10448.201474] uvcvideo: Dropping payload (out of sync).
[10448.201482] uvcvideo: Dropping payload (out of sync).
[10448.201486] uvcvideo: Dropping payload (out of sync).
[10448.201489] uvcvideo: Dropping payload (out of sync).
[10448.201494] uvcvideo: Dropping payload (out of sync).
[10448.201568] uvcvideo: Dropping payload (out of sync).
[10448.201575] uvcvideo: Dropping payload (out of sync).
[10448.201581] uvcvideo: Dropping payload (out of sync).
[10448.201586] uvcvideo: Dropping payload (out of sync).
[10448.201594] uvcvideo: Dropping payload (out of sync).
[10448.201598] uvcvideo: Dropping payload (out of sync).
[10448.201602] uvcvideo: Dropping payload (out of sync).
[10448.201607] uvcvideo: Dropping payload (out of sync).
[10448.201612] uvcvideo: Dropping payload (out of sync).
[10448.201672] uvcvideo: uvc_v4l2_poll
[10448.205431] uvcvideo: Dropping payload (out of sync).
[10448.205435] uvcvideo: Dropping payload (out of sync).
[10448.205436] uvcvideo: Dropping payload (out of sync).
[10448.205441] uvcvideo: Dropping payload (out of sync).
[10448.205442] uvcvideo: Dropping payload (out of sync).
[10448.205443] uvcvideo: Dropping payload (out of sync).
[10448.205556] uvcvideo: Dropping payload (out of sync).
[10448.205557] uvcvideo: Dropping payload (out of sync).
[10448.205558] uvcvideo: Dropping payload (out of sync).
[10448.205559] uvcvideo: Dropping payload (out of sync).
[10448.205560] uvcvideo: Dropping payload (out of sync).
[10448.205563] uvcvideo: Dropping payload (out of sync).
[10448.205564] uvcvideo: Dropping payload (out of sync).
[10448.205565] uvcvideo: Dropping payload (out of sync).
[10448.205567] uvcvideo: Dropping payload (out of sync).
[10448.205568] uvcvideo: Dropping payload (out of sync).
[10448.205569] uvcvideo: Dropping payload (out of sync).
[10448.205570] uvcvideo: Dropping payload (out of sync).
[10448.205571] uvcvideo: Dropping payload (out of sync).
[10448.205574] uvcvideo: Dropping payload (out of sync).
[10448.205575] uvcvideo: Dropping payload (out of sync).
[10448.205576] uvcvideo: Dropping payload (out of sync).
[10448.205577] uvcvideo: Dropping payload (out of sync).
[10448.205581] uvcvideo: Dropping payload (out of sync).
[10448.205582] uvcvideo: Dropping payload (out of sync).
[10448.205584] uvcvideo: Dropping payload (out of sync).
[10448.205585] uvcvideo: Dropping payload (out of sync).
[10448.205588] uvcvideo: Dropping payload (out of sync).
[10448.205589] uvcvideo: Dropping payload (out of sync).
[10448.205590] uvcvideo: Dropping payload (out of sync).
[10448.205591] uvcvideo: Dropping payload (out of sync).
[10448.205592] uvcvideo: Dropping payload (out of sync).
[10448.208797] uvcvideo: uvc_v4l2_poll
[10448.209438] uvcvideo: Dropping payload (out of sync).
[10448.209444] uvcvideo: frame 205660 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 348244921/348754215/663
[10448.233351] uvcvideo: Frame complete (EOF found).
[10448.233353] uvcvideo: Dropping payload (out of sync).
[10448.233353] uvcvideo: Dropping payload (out of sync).
[10448.233354] uvcvideo: Dropping payload (out of sync).
[10448.233356] uvcvideo: Dropping payload (out of sync).
[10448.233356] uvcvideo: Dropping payload (out of sync).
[10448.233357] uvcvideo: Dropping payload (out of sync).
[10448.233357] uvcvideo: Dropping payload (out of sync).
[10448.233357] uvcvideo: Dropping payload (out of sync).
[10448.233389] uvcvideo: uvc_v4l2_poll
[10448.236510] uvcvideo: uvc_v4l2_poll
[10448.237343] uvcvideo: Dropping payload (out of sync).
[10448.237344] uvcvideo: Dropping payload (out of sync).
[10448.237345] uvcvideo: Dropping payload (out of sync).
[10448.237348] uvcvideo: Dropping payload (out of sync).
[10448.237348] uvcvideo: Dropping payload (out of sync).
[10448.237349] uvcvideo: Dropping payload (out of sync).
[10448.237349] uvcvideo: Dropping payload (out of sync).
[10448.237350] uvcvideo: Dropping payload (out of sync).
[10448.237350] uvcvideo: Dropping payload (out of sync).
[10448.237350] uvcvideo: Dropping payload (out of sync).
[10448.237351] uvcvideo: Dropping payload (out of sync).
[10448.237353] uvcvideo: Dropping payload (out of sync).
[10448.237353] uvcvideo: Dropping payload (out of sync).
[10448.237354] uvcvideo: Dropping payload (out of sync).
[10448.237354] uvcvideo: Dropping payload (out of sync).
[10448.237355] uvcvideo: Dropping payload (out of sync).
[10448.237355] uvcvideo: Dropping payload (out of sync).
[10448.237355] uvcvideo: Dropping payload (out of sync).
[10448.237356] uvcvideo: Dropping payload (out of sync).
[10448.237358] uvcvideo: Dropping payload (out of sync).
[10448.237358] uvcvideo: Dropping payload (out of sync).
[10448.237359] uvcvideo: Dropping payload (out of sync).
[10448.237359] uvcvideo: Dropping payload (out of sync).
[10448.237359] uvcvideo: Dropping payload (out of sync).
[10448.237360] uvcvideo: Dropping payload (out of sync).
[10448.237360] uvcvideo: Dropping payload (out of sync).
[10448.237360] uvcvideo: Dropping payload (out of sync).
[10448.237363] uvcvideo: Dropping payload (out of sync).
[10448.237363] uvcvideo: Dropping payload (out of sync).
[10448.237364] uvcvideo: Dropping payload (out of sync).
[10448.237364] uvcvideo: Dropping payload (out of sync).
[10448.237364] uvcvideo: Dropping payload (out of sync).
[10448.241386] uvcvideo: Dropping payload (out of sync).
[10448.241388] uvcvideo: Dropping payload (out of sync).
[10448.241388] uvcvideo: Dropping payload (out of sync).
[10448.241397] uvcvideo: Dropping payload (out of sync).
[10448.241398] uvcvideo: Dropping payload (out of sync).
[10448.241398] uvcvideo: Dropping payload (out of sync).
[10448.241399] uvcvideo: Dropping payload (out of sync).
[10448.241399] uvcvideo: Dropping payload (out of sync).
[10448.241400] uvcvideo: Dropping payload (out of sync).
[10448.241401] uvcvideo: Dropping payload (out of sync).
[10448.241401] uvcvideo: Dropping payload (out of sync).
[10448.241403] uvcvideo: Dropping payload (out of sync).
[10448.241406] uvcvideo: frame 205661 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 348745344/349254833/697
[10448.269344] uvcvideo: Frame complete (EOF found).
[10448.269348] uvcvideo: Dropping payload (out of sync).
[10448.269348] uvcvideo: Dropping payload (out of sync).
[10448.269349] uvcvideo: Dropping payload (out of sync).
[10448.269349] uvcvideo: Dropping payload (out of sync).
[10448.269349] uvcvideo: Dropping payload (out of sync).
[10448.269350] uvcvideo: Dropping payload (out of sync).
[10448.269350] uvcvideo: Dropping payload (out of sync).
[10448.269350] uvcvideo: Dropping payload (out of sync).
[10448.269353] uvcvideo: Dropping payload (out of sync).
[10448.269353] uvcvideo: Dropping payload (out of sync).
[10448.269353] uvcvideo: Dropping payload (out of sync).
[10448.269353] uvcvideo: Dropping payload (out of sync).
[10448.269354] uvcvideo: Dropping payload (out of sync).
[10448.269354] uvcvideo: Dropping payload (out of sync).
[10448.269354] uvcvideo: Dropping payload (out of sync).
[10448.269355] uvcvideo: Dropping payload (out of sync).
[10448.269357] uvcvideo: Dropping payload (out of sync).
[10448.269358] uvcvideo: Dropping payload (out of sync).
[10448.269358] uvcvideo: Dropping payload (out of sync).
[10448.269358] uvcvideo: Dropping payload (out of sync).
[10448.269358] uvcvideo: Dropping payload (out of sync).
[10448.269359] uvcvideo: Dropping payload (out of sync).
[10448.269359] uvcvideo: Dropping payload (out of sync).
[10448.269359] uvcvideo: Dropping payload (out of sync).
[10448.269362] uvcvideo: Dropping payload (out of sync).
[10448.269362] uvcvideo: Dropping payload (out of sync).
[10448.269363] uvcvideo: Dropping payload (out of sync).
[10448.269363] uvcvideo: Dropping payload (out of sync).
[10448.269363] uvcvideo: Dropping payload (out of sync).
[10448.269399] uvcvideo: uvc_v4l2_poll
[10448.273387] uvcvideo: Dropping payload (out of sync).
[10448.273389] uvcvideo: Dropping payload (out of sync).
[10448.273389] uvcvideo: Dropping payload (out of sync).
[10448.273393] uvcvideo: Dropping payload (out of sync).
[10448.273394] uvcvideo: Dropping payload (out of sync).
[10448.273394] uvcvideo: Dropping payload (out of sync).
[10448.273395] uvcvideo: Dropping payload (out of sync).
[10448.273447] uvcvideo: Dropping payload (out of sync).
[10448.273448] uvcvideo: Dropping payload (out of sync).
[10448.273448] uvcvideo: Dropping payload (out of sync).
[10448.273449] uvcvideo: Dropping payload (out of sync).
[10448.273452] uvcvideo: Dropping payload (out of sync).
[10448.273453] uvcvideo: Dropping payload (out of sync).
[10448.273453] uvcvideo: Dropping payload (out of sync).
[10448.273454] uvcvideo: Dropping payload (out of sync).
[10448.273454] uvcvideo: Dropping payload (out of sync).
[10448.273455] uvcvideo: Dropping payload (out of sync).
[10448.273455] uvcvideo: Dropping payload (out of sync).
[10448.273456] uvcvideo: Dropping payload (out of sync).
[10448.273458] uvcvideo: Dropping payload (out of sync).
[10448.273459] uvcvideo: Dropping payload (out of sync).
[10448.273459] uvcvideo: Dropping payload (out of sync).
[10448.273460] uvcvideo: Dropping payload (out of sync).
[10448.273463] uvcvideo: frame 205662 stats: 0/170/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 349245768/349755450/730
[10448.273559] uvcvideo: uvc_v4l2_poll
[10448.301349] uvcvideo: Frame complete (EOF found).
[10448.301351] uvcvideo: Dropping payload (out of sync).
[10448.301351] uvcvideo: Dropping payload (out of sync).
[10448.301351] uvcvideo: Dropping payload (out of sync).
[10448.301352] uvcvideo: Dropping payload (out of sync).
[10448.301352] uvcvideo: Dropping payload (out of sync).
[10448.301354] uvcvideo: Dropping payload (out of sync).
[10448.301355] uvcvideo: Dropping payload (out of sync).
[10448.301355] uvcvideo: Dropping payload (out of sync).
[10448.301355] uvcvideo: Dropping payload (out of sync).
[10448.301355] uvcvideo: Dropping payload (out of sync).
[10448.301356] uvcvideo: Dropping payload (out of sync).
[10448.301356] uvcvideo: Dropping payload (out of sync).
[10448.301356] uvcvideo: Dropping payload (out of sync).
[10448.301359] uvcvideo: Dropping payload (out of sync).
[10448.301359] uvcvideo: Dropping payload (out of sync).
[10448.301359] uvcvideo: Dropping payload (out of sync).
[10448.301360] uvcvideo: Dropping payload (out of sync).
[10448.301360] uvcvideo: Dropping payload (out of sync).
[10448.301395] uvcvideo: uvc_v4l2_poll
[10448.305356] uvcvideo: Dropping payload (out of sync).
[10448.305359] uvcvideo: Dropping payload (out of sync).
[10448.305360] uvcvideo: Dropping payload (out of sync).
[10448.305417] uvcvideo: Dropping payload (out of sync).
[10448.305420] uvcvideo: uvc_v4l2_poll
[10448.305420] uvcvideo: Dropping payload (out of sync).
[10448.305420] uvcvideo: Dropping payload (out of sync).
[10448.305421] uvcvideo: Dropping payload (out of sync).
[10448.305422] uvcvideo: Dropping payload (out of sync).
[10448.305422] uvcvideo: Dropping payload (out of sync).
[10448.305423] uvcvideo: Dropping payload (out of sync).
[10448.305423] uvcvideo: Dropping payload (out of sync).
[10448.305426] uvcvideo: Dropping payload (out of sync).
[10448.305426] uvcvideo: Dropping payload (out of sync).
[10448.305427] uvcvideo: Dropping payload (out of sync).
[10448.305427] uvcvideo: Dropping payload (out of sync).
[10448.305428] uvcvideo: Dropping payload (out of sync).
[10448.305428] uvcvideo: Dropping payload (out of sync).
[10448.305429] uvcvideo: Dropping payload (out of sync).
[10448.305429] uvcvideo: Dropping payload (out of sync).
[10448.305431] uvcvideo: Dropping payload (out of sync).
[10448.305432] uvcvideo: Dropping payload (out of sync).
[10448.305432] uvcvideo: Dropping payload (out of sync).
[10448.305433] uvcvideo: Dropping payload (out of sync).
[10448.305433] uvcvideo: Dropping payload (out of sync).
[10448.305436] uvcvideo: Dropping payload (out of sync).
[10448.305436] uvcvideo: Dropping payload (out of sync).
[10448.305437] uvcvideo: Dropping payload (out of sync).
[10448.305440] uvcvideo: Dropping payload (out of sync).
[10448.305440] uvcvideo: Dropping payload (out of sync).
[10448.305441] uvcvideo: Dropping payload (out of sync).
[10448.305444] uvcvideo: Dropping payload (out of sync).
[10448.305445] uvcvideo: Dropping payload (out of sync).
[10448.309370] uvcvideo: Dropping payload (out of sync).
[10448.309377] uvcvideo: frame 205663 stats: 0/170/266 packets, 0/0/266 pts (!early initial), 265/266 scr, last pts/stc/sof 349746191/350254192/763
[10448.333353] uvcvideo: Frame complete (EOF found).
[10448.333354] uvcvideo: Dropping payload (out of sync).
[10448.333355] uvcvideo: Dropping payload (out of sync).
[10448.333355] uvcvideo: Dropping payload (out of sync).
[10448.333357] uvcvideo: Dropping payload (out of sync).
[10448.333358] uvcvideo: Dropping payload (out of sync).
[10448.333358] uvcvideo: Dropping payload (out of sync).
[10448.333358] uvcvideo: Dropping payload (out of sync).
[10448.333359] uvcvideo: Dropping payload (out of sync).
[10448.333397] uvcvideo: uvc_v4l2_poll
[10448.337312] uvcvideo: uvc_v4l2_poll
[10448.337342] uvcvideo: Dropping payload (out of sync).
[10448.337343] uvcvideo: Dropping payload (out of sync).
[10448.337344] uvcvideo: Dropping payload (out of sync).
[10448.337347] uvcvideo: Dropping payload (out of sync).
[10448.337347] uvcvideo: Dropping payload (out of sync).
[10448.337348] uvcvideo: Dropping payload (out of sync).
[10448.337348] uvcvideo: Dropping payload (out of sync).
[10448.337349] uvcvideo: Dropping payload (out of sync).
[10448.337349] uvcvideo: Dropping payload (out of sync).
[10448.337349] uvcvideo: Dropping payload (out of sync).
[10448.337350] uvcvideo: Dropping payload (out of sync).
[10448.337352] uvcvideo: Dropping payload (out of sync).
[10448.337352] uvcvideo: Dropping payload (out of sync).
[10448.337353] uvcvideo: Dropping payload (out of sync).
[10448.337353] uvcvideo: Dropping payload (out of sync).
[10448.337353] uvcvideo: Dropping payload (out of sync).
[10448.337354] uvcvideo: Dropping payload (out of sync).
[10448.337354] uvcvideo: Dropping payload (out of sync).
[10448.337355] uvcvideo: Dropping payload (out of sync).
[10448.337357] uvcvideo: Dropping payload (out of sync).
[10448.337357] uvcvideo: Dropping payload (out of sync).
[10448.337358] uvcvideo: Dropping payload (out of sync).
[10448.337358] uvcvideo: Dropping payload (out of sync).
[10448.337358] uvcvideo: Dropping payload (out of sync).
[10448.337359] uvcvideo: Dropping payload (out of sync).
[10448.337359] uvcvideo: Dropping payload (out of sync).
[10448.337359] uvcvideo: Dropping payload (out of sync).
[10448.337362] uvcvideo: Dropping payload (out of sync).
[10448.337362] uvcvideo: Dropping payload (out of sync).
[10448.337363] uvcvideo: Dropping payload (out of sync).
[10448.337363] uvcvideo: Dropping payload (out of sync).
[10448.337363] uvcvideo: Dropping payload (out of sync).
[10448.341349] uvcvideo: Dropping payload (out of sync).
[10448.341351] uvcvideo: Dropping payload (out of sync).
[10448.341351] uvcvideo: Dropping payload (out of sync).
[10448.341354] uvcvideo: Dropping payload (out of sync).
[10448.341355] uvcvideo: Dropping payload (out of sync).
[10448.341356] uvcvideo: Dropping payload (out of sync).
[10448.341356] uvcvideo: Dropping payload (out of sync).
[10448.341357] uvcvideo: Dropping payload (out of sync).
[10448.341357] uvcvideo: Dropping payload (out of sync).
[10448.341358] uvcvideo: Dropping payload (out of sync).
[10448.341358] uvcvideo: Dropping payload (out of sync).
[10448.341360] uvcvideo: Dropping payload (out of sync).
[10448.341364] uvcvideo: frame 205664 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 350246614/350754810/797
[10448.369345] uvcvideo: Frame complete (EOF found).
[10448.369349] uvcvideo: Dropping payload (out of sync).
[10448.369349] uvcvideo: Dropping payload (out of sync).
[10448.369349] uvcvideo: Dropping payload (out of sync).
[10448.369350] uvcvideo: Dropping payload (out of sync).
[10448.369350] uvcvideo: Dropping payload (out of sync).
[10448.369350] uvcvideo: Dropping payload (out of sync).
[10448.369351] uvcvideo: Dropping payload (out of sync).
[10448.369351] uvcvideo: Dropping payload (out of sync).
[10448.369353] uvcvideo: Dropping payload (out of sync).
[10448.369354] uvcvideo: Dropping payload (out of sync).
[10448.369354] uvcvideo: Dropping payload (out of sync).
[10448.369354] uvcvideo: Dropping payload (out of sync).
[10448.369354] uvcvideo: Dropping payload (out of sync).
[10448.369355] uvcvideo: Dropping payload (out of sync).
[10448.369355] uvcvideo: Dropping payload (out of sync).
[10448.369355] uvcvideo: Dropping payload (out of sync).
[10448.369358] uvcvideo: Dropping payload (out of sync).
[10448.369358] uvcvideo: Dropping payload (out of sync).
[10448.369359] uvcvideo: Dropping payload (out of sync).
[10448.369359] uvcvideo: Dropping payload (out of sync).
[10448.369359] uvcvideo: Dropping payload (out of sync).
[10448.369359] uvcvideo: Dropping payload (out of sync).
[10448.369360] uvcvideo: Dropping payload (out of sync).
[10448.369360] uvcvideo: Dropping payload (out of sync).
[10448.369363] uvcvideo: Dropping payload (out of sync).
[10448.369363] uvcvideo: Dropping payload (out of sync).
[10448.369363] uvcvideo: Dropping payload (out of sync).
[10448.369364] uvcvideo: Dropping payload (out of sync).
[10448.369364] uvcvideo: Dropping payload (out of sync).
[10448.369401] uvcvideo: uvc_v4l2_poll
[10448.373362] uvcvideo: Dropping payload (out of sync).
[10448.373364] uvcvideo: Dropping payload (out of sync).
[10448.373364] uvcvideo: Dropping payload (out of sync).
[10448.373369] uvcvideo: Dropping payload (out of sync).
[10448.373369] uvcvideo: Dropping payload (out of sync).
[10448.373370] uvcvideo: Dropping payload (out of sync).
[10448.373371] uvcvideo: Dropping payload (out of sync).
[10448.373427] uvcvideo: uvc_v4l2_poll
[10448.373426] uvcvideo: Dropping payload (out of sync).
[10448.373427] uvcvideo: Dropping payload (out of sync).
[10448.373429] uvcvideo: Dropping payload (out of sync).
[10448.373429] uvcvideo: Dropping payload (out of sync).
[10448.373437] uvcvideo: Dropping payload (out of sync).
[10448.373438] uvcvideo: Dropping payload (out of sync).
[10448.373439] uvcvideo: Dropping payload (out of sync).
[10448.373439] uvcvideo: Dropping payload (out of sync).
[10448.373440] uvcvideo: Dropping payload (out of sync).
[10448.373440] uvcvideo: Dropping payload (out of sync).
[10448.373441] uvcvideo: Dropping payload (out of sync).
[10448.373441] uvcvideo: Dropping payload (out of sync).
[10448.373446] uvcvideo: Dropping payload (out of sync).
[10448.373446] uvcvideo: Dropping payload (out of sync).
[10448.373447] uvcvideo: Dropping payload (out of sync).
[10448.373447] uvcvideo: Dropping payload (out of sync).
[10448.373450] uvcvideo: frame 205665 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 350747038/351255426/830
[10448.401352] uvcvideo: Frame complete (EOF found).
[10448.401354] uvcvideo: Dropping payload (out of sync).
[10448.401355] uvcvideo: Dropping payload (out of sync).
[10448.401355] uvcvideo: Dropping payload (out of sync).
[10448.401356] uvcvideo: Dropping payload (out of sync).
[10448.401356] uvcvideo: Dropping payload (out of sync).
[10448.401358] uvcvideo: Dropping payload (out of sync).
[10448.401359] uvcvideo: Dropping payload (out of sync).
[10448.401359] uvcvideo: Dropping payload (out of sync).
[10448.401359] uvcvideo: Dropping payload (out of sync).
[10448.401359] uvcvideo: Dropping payload (out of sync).
[10448.401360] uvcvideo: Dropping payload (out of sync).
[10448.401360] uvcvideo: Dropping payload (out of sync).
[10448.401360] uvcvideo: Dropping payload (out of sync).
[10448.401363] uvcvideo: Dropping payload (out of sync).
[10448.401363] uvcvideo: Dropping payload (out of sync).
[10448.401364] uvcvideo: Dropping payload (out of sync).
[10448.401364] uvcvideo: Dropping payload (out of sync).
[10448.401364] uvcvideo: Dropping payload (out of sync).
[10448.401416] uvcvideo: uvc_v4l2_poll
[10448.405351] uvcvideo: Dropping payload (out of sync).
[10448.405352] uvcvideo: Dropping payload (out of sync).
[10448.405353] uvcvideo: Dropping payload (out of sync).
[10448.405356] uvcvideo: Dropping payload (out of sync).
[10448.405356] uvcvideo: Dropping payload (out of sync).
[10448.405357] uvcvideo: Dropping payload (out of sync).
[10448.405357] uvcvideo: Dropping payload (out of sync).
[10448.405357] uvcvideo: Dropping payload (out of sync).
[10448.405358] uvcvideo: Dropping payload (out of sync).
[10448.405358] uvcvideo: Dropping payload (out of sync).
[10448.405358] uvcvideo: Dropping payload (out of sync).
[10448.405361] uvcvideo: Dropping payload (out of sync).
[10448.405361] uvcvideo: Dropping payload (out of sync).
[10448.405362] uvcvideo: Dropping payload (out of sync).
[10448.405362] uvcvideo: Dropping payload (out of sync).
[10448.405362] uvcvideo: Dropping payload (out of sync).
[10448.405363] uvcvideo: Dropping payload (out of sync).
[10448.405363] uvcvideo: Dropping payload (out of sync).
[10448.405363] uvcvideo: Dropping payload (out of sync).
[10448.405366] uvcvideo: Dropping payload (out of sync).
[10448.405366] uvcvideo: Dropping payload (out of sync).
[10448.405367] uvcvideo: Dropping payload (out of sync).
[10448.405367] uvcvideo: Dropping payload (out of sync).
[10448.405367] uvcvideo: Dropping payload (out of sync).
[10448.405368] uvcvideo: Dropping payload (out of sync).
[10448.405368] uvcvideo: Dropping payload (out of sync).
[10448.405368] uvcvideo: Dropping payload (out of sync).
[10448.405371] uvcvideo: Dropping payload (out of sync).
[10448.405371] uvcvideo: Dropping payload (out of sync).
[10448.405372] uvcvideo: Dropping payload (out of sync).
[10448.405372] uvcvideo: Dropping payload (out of sync).
[10448.405372] uvcvideo: Dropping payload (out of sync).
[10448.406838] uvcvideo: uvc_v4l2_poll
[10448.409394] uvcvideo: Dropping payload (out of sync).
[10448.409398] uvcvideo: Dropping payload (out of sync).
[10448.409455] uvcvideo: frame 205666 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 351247462/351756044/863
[10448.433364] uvcvideo: Frame complete (EOF found).
[10448.433378] uvcvideo: Dropping payload (out of sync).
[10448.433389] uvcvideo: Dropping payload (out of sync).
[10448.433512] uvcvideo: Dropping payload (out of sync).
[10448.433517] uvcvideo: Dropping payload (out of sync).
[10448.433521] uvcvideo: Dropping payload (out of sync).
[10448.433526] uvcvideo: Dropping payload (out of sync).
[10448.433530] uvcvideo: Dropping payload (out of sync).
[10448.433681] uvcvideo: uvc_v4l2_poll
[10448.437353] uvcvideo: Dropping payload (out of sync).
[10448.437355] uvcvideo: Dropping payload (out of sync).
[10448.437356] uvcvideo: Dropping payload (out of sync).
[10448.437359] uvcvideo: Dropping payload (out of sync).
[10448.437360] uvcvideo: Dropping payload (out of sync).
[10448.437361] uvcvideo: Dropping payload (out of sync).
[10448.437362] uvcvideo: Dropping payload (out of sync).
[10448.437362] uvcvideo: Dropping payload (out of sync).
[10448.437363] uvcvideo: Dropping payload (out of sync).
[10448.437364] uvcvideo: Dropping payload (out of sync).
[10448.437365] uvcvideo: Dropping payload (out of sync).
[10448.437367] uvcvideo: Dropping payload (out of sync).
[10448.437368] uvcvideo: Dropping payload (out of sync).
[10448.437369] uvcvideo: Dropping payload (out of sync).
[10448.437370] uvcvideo: Dropping payload (out of sync).
[10448.437371] uvcvideo: Dropping payload (out of sync).
[10448.437371] uvcvideo: Dropping payload (out of sync).
[10448.437372] uvcvideo: Dropping payload (out of sync).
[10448.437373] uvcvideo: Dropping payload (out of sync).
[10448.437376] uvcvideo: Dropping payload (out of sync).
[10448.437377] uvcvideo: Dropping payload (out of sync).
[10448.437377] uvcvideo: Dropping payload (out of sync).
[10448.437378] uvcvideo: Dropping payload (out of sync).
[10448.437379] uvcvideo: Dropping payload (out of sync).
[10448.437380] uvcvideo: Dropping payload (out of sync).
[10448.437380] uvcvideo: Dropping payload (out of sync).
[10448.437381] uvcvideo: Dropping payload (out of sync).
[10448.437384] uvcvideo: Dropping payload (out of sync).
[10448.437385] uvcvideo: Dropping payload (out of sync).
[10448.437386] uvcvideo: Dropping payload (out of sync).
[10448.437387] uvcvideo: Dropping payload (out of sync).
[10448.437387] uvcvideo: Dropping payload (out of sync).
[10448.439576] uvcvideo: uvc_v4l2_poll
[10448.441385] uvcvideo: Dropping payload (out of sync).
[10448.441387] uvcvideo: Dropping payload (out of sync).
[10448.441389] uvcvideo: Dropping payload (out of sync).
[10448.441396] uvcvideo: Dropping payload (out of sync).
[10448.441397] uvcvideo: Dropping payload (out of sync).
[10448.441399] uvcvideo: Dropping payload (out of sync).
[10448.441400] uvcvideo: Dropping payload (out of sync).
[10448.441401] uvcvideo: Dropping payload (out of sync).
[10448.441403] uvcvideo: Dropping payload (out of sync).
[10448.441404] uvcvideo: Dropping payload (out of sync).
[10448.441405] uvcvideo: Dropping payload (out of sync).
[10448.441408] uvcvideo: Dropping payload (out of sync).
[10448.441409] uvcvideo: Dropping payload (out of sync).
[10448.441416] uvcvideo: frame 205667 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 351747885/352256661/897
[10448.469353] uvcvideo: Frame complete (EOF found).
[10448.469364] uvcvideo: Dropping payload (out of sync).
[10448.469367] uvcvideo: Dropping payload (out of sync).
[10448.469369] uvcvideo: Dropping payload (out of sync).
[10448.469442] uvcvideo: Dropping payload (out of sync).
[10448.469449] uvcvideo: Dropping payload (out of sync).
[10448.469455] uvcvideo: Dropping payload (out of sync).
[10448.469459] uvcvideo: Dropping payload (out of sync).
[10448.469532] uvcvideo: Dropping payload (out of sync).
[10448.469540] uvcvideo: Dropping payload (out of sync).
[10448.469545] uvcvideo: Dropping payload (out of sync).
[10448.469549] uvcvideo: Dropping payload (out of sync).
[10448.469554] uvcvideo: Dropping payload (out of sync).
[10448.469559] uvcvideo: Dropping payload (out of sync).
[10448.469563] uvcvideo: Dropping payload (out of sync).
[10448.469569] uvcvideo: Dropping payload (out of sync).
[10448.469577] uvcvideo: Dropping payload (out of sync).
[10448.469582] uvcvideo: Dropping payload (out of sync).
[10448.469586] uvcvideo: Dropping payload (out of sync).
[10448.469591] uvcvideo: Dropping payload (out of sync).
[10448.469595] uvcvideo: Dropping payload (out of sync).
[10448.469600] uvcvideo: Dropping payload (out of sync).
[10448.469605] uvcvideo: Dropping payload (out of sync).
[10448.469609] uvcvideo: Dropping payload (out of sync).
[10448.469681] uvcvideo: Dropping payload (out of sync).
[10448.469688] uvcvideo: Dropping payload (out of sync).
[10448.469692] uvcvideo: Dropping payload (out of sync).
[10448.469764] uvcvideo: Dropping payload (out of sync).
[10448.469772] uvcvideo: Dropping payload (out of sync).
[10448.469810] uvcvideo: uvc_v4l2_poll
[10448.473490] uvcvideo: Dropping payload (out of sync).
[10448.473499] uvcvideo: Dropping payload (out of sync).
[10448.473505] uvcvideo: Dropping payload (out of sync).
[10448.473642] uvcvideo: Dropping payload (out of sync).
[10448.473652] uvcvideo: Dropping payload (out of sync).
[10448.473656] uvcvideo: Dropping payload (out of sync).
[10448.473661] uvcvideo: Dropping payload (out of sync).
[10448.473666] uvcvideo: Dropping payload (out of sync).
[10448.473672] uvcvideo: Dropping payload (out of sync).
[10448.473679] uvcvideo: Dropping payload (out of sync).
[10448.473683] uvcvideo: Dropping payload (out of sync).
[10448.473690] uvcvideo: Dropping payload (out of sync).
[10448.473695] uvcvideo: Dropping payload (out of sync).
[10448.473699] uvcvideo: Dropping payload (out of sync).
[10448.473704] uvcvideo: Dropping payload (out of sync).
[10448.473710] uvcvideo: Dropping payload (out of sync).
[10448.473714] uvcvideo: Dropping payload (out of sync).
[10448.473720] uvcvideo: Dropping payload (out of sync).
[10448.473724] uvcvideo: Dropping payload (out of sync).
[10448.473732] uvcvideo: Dropping payload (out of sync).
[10448.473737] uvcvideo: Dropping payload (out of sync).
[10448.473742] uvcvideo: Dropping payload (out of sync).
[10448.473747] uvcvideo: Dropping payload (out of sync).
[10448.473888] uvcvideo: Dropping payload (out of sync).
[10448.473901] uvcvideo: frame 205668 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 352248309/352757279/930
[10448.474429] uvcvideo: uvc_v4l2_poll
[10448.501363] uvcvideo: Frame complete (EOF found).
[10448.501380] uvcvideo: Dropping payload (out of sync).
[10448.501385] uvcvideo: Dropping payload (out of sync).
[10448.501388] uvcvideo: Dropping payload (out of sync).
[10448.501392] uvcvideo: Dropping payload (out of sync).
[10448.501534] uvcvideo: Dropping payload (out of sync).
[10448.501539] uvcvideo: Dropping payload (out of sync).
[10448.501544] uvcvideo: Dropping payload (out of sync).
[10448.501549] uvcvideo: Dropping payload (out of sync).
[10448.501553] uvcvideo: Dropping payload (out of sync).
[10448.501558] uvcvideo: Dropping payload (out of sync).
[10448.501563] uvcvideo: Dropping payload (out of sync).
[10448.501568] uvcvideo: Dropping payload (out of sync).
[10448.501709] uvcvideo: Dropping payload (out of sync).
[10448.501714] uvcvideo: Dropping payload (out of sync).
[10448.501719] uvcvideo: Dropping payload (out of sync).
[10448.501723] uvcvideo: Dropping payload (out of sync).
[10448.501728] uvcvideo: Dropping payload (out of sync).
[10448.501782] uvcvideo: uvc_v4l2_poll
[10448.505433] uvcvideo: Dropping payload (out of sync).
[10448.505442] uvcvideo: Dropping payload (out of sync).
[10448.505448] uvcvideo: Dropping payload (out of sync).
[10448.505591] uvcvideo: Dropping payload (out of sync).
[10448.505596] uvcvideo: Dropping payload (out of sync).
[10448.505601] uvcvideo: Dropping payload (out of sync).
[10448.505608] uvcvideo: Dropping payload (out of sync).
[10448.505612] uvcvideo: Dropping payload (out of sync).
[10448.505617] uvcvideo: Dropping payload (out of sync).
[10448.505622] uvcvideo: Dropping payload (out of sync).
[10448.505626] uvcvideo: Dropping payload (out of sync).
[10448.505634] uvcvideo: Dropping payload (out of sync).
[10448.505639] uvcvideo: Dropping payload (out of sync).
[10448.505644] uvcvideo: Dropping payload (out of sync).
[10448.505648] uvcvideo: Dropping payload (out of sync).
[10448.505653] uvcvideo: Dropping payload (out of sync).
[10448.505658] uvcvideo: Dropping payload (out of sync).
[10448.505662] uvcvideo: Dropping payload (out of sync).
[10448.505668] uvcvideo: Dropping payload (out of sync).
[10448.505812] uvcvideo: Dropping payload (out of sync).
[10448.505818] uvcvideo: Dropping payload (out of sync).
[10448.505822] uvcvideo: Dropping payload (out of sync).
[10448.505828] uvcvideo: Dropping payload (out of sync).
[10448.505836] uvcvideo: Dropping payload (out of sync).
[10448.505981] uvcvideo: Dropping payload (out of sync).
[10448.505986] uvcvideo: Dropping payload (out of sync).
[10448.505991] uvcvideo: Dropping payload (out of sync).
[10448.505998] uvcvideo: Dropping payload (out of sync).
[10448.506003] uvcvideo: Dropping payload (out of sync).
[10448.506008] uvcvideo: Dropping payload (out of sync).
[10448.506013] uvcvideo: Dropping payload (out of sync).
[10448.506017] uvcvideo: Dropping payload (out of sync).
[10448.506701] uvcvideo: uvc_v4l2_poll
[10448.509493] uvcvideo: Dropping payload (out of sync).
[10448.509501] uvcvideo: Dropping payload (out of sync).
[10448.509505] uvcvideo: Dropping payload (out of sync).
[10448.509513] uvcvideo: frame 205669 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 352748732/353257897/963
[10448.533366] uvcvideo: Frame complete (EOF found).
[10448.533383] uvcvideo: Dropping payload (out of sync).
[10448.533525] uvcvideo: Dropping payload (out of sync).
[10448.533534] uvcvideo: Dropping payload (out of sync).
[10448.533538] uvcvideo: Dropping payload (out of sync).
[10448.533544] uvcvideo: Dropping payload (out of sync).
[10448.533551] uvcvideo: Dropping payload (out of sync).
[10448.533705] uvcvideo: uvc_v4l2_poll
[10448.537357] uvcvideo: Dropping payload (out of sync).
[10448.537370] uvcvideo: Dropping payload (out of sync).
[10448.537376] uvcvideo: Dropping payload (out of sync).
[10448.537515] uvcvideo: Dropping payload (out of sync).
[10448.537520] uvcvideo: Dropping payload (out of sync).
[10448.537527] uvcvideo: Dropping payload (out of sync).
[10448.537533] uvcvideo: Dropping payload (out of sync).
[10448.537538] uvcvideo: Dropping payload (out of sync).
[10448.537678] uvcvideo: Dropping payload (out of sync).
[10448.537683] uvcvideo: Dropping payload (out of sync).
[10448.537687] uvcvideo: Dropping payload (out of sync).
[10448.537693] uvcvideo: Dropping payload (out of sync).
[10448.537699] uvcvideo: Dropping payload (out of sync).
[10448.537703] uvcvideo: Dropping payload (out of sync).
[10448.537708] uvcvideo: Dropping payload (out of sync).
[10448.537714] uvcvideo: Dropping payload (out of sync).
[10448.537720] uvcvideo: Dropping payload (out of sync).
[10448.537727] uvcvideo: Dropping payload (out of sync).
[10448.537731] uvcvideo: Dropping payload (out of sync).
[10448.537737] uvcvideo: Dropping payload (out of sync).
[10448.537742] uvcvideo: Dropping payload (out of sync).
[10448.537748] uvcvideo: Dropping payload (out of sync).
[10448.537755] uvcvideo: Dropping payload (out of sync).
[10448.537760] uvcvideo: Dropping payload (out of sync).
[10448.537765] uvcvideo: Dropping payload (out of sync).
[10448.537769] uvcvideo: Dropping payload (out of sync).
[10448.537774] uvcvideo: Dropping payload (out of sync).
[10448.537914] uvcvideo: Dropping payload (out of sync).
[10448.537920] uvcvideo: Dropping payload (out of sync).
[10448.537925] uvcvideo: Dropping payload (out of sync).
[10448.537929] uvcvideo: Dropping payload (out of sync).
[10448.537932] uvcvideo: Dropping payload (out of sync).
[10448.538104] uvcvideo: uvc_v4l2_poll
[10448.541415] uvcvideo: Dropping payload (out of sync).
[10448.541424] uvcvideo: Dropping payload (out of sync).
[10448.541430] uvcvideo: Dropping payload (out of sync).
[10448.541568] uvcvideo: Dropping payload (out of sync).
[10448.541571] uvcvideo: Dropping payload (out of sync).
[10448.541575] uvcvideo: Dropping payload (out of sync).
[10448.541578] uvcvideo: Dropping payload (out of sync).
[10448.541581] uvcvideo: Dropping payload (out of sync).
[10448.541584] uvcvideo: Dropping payload (out of sync).
[10448.541587] uvcvideo: Dropping payload (out of sync).
[10448.541590] uvcvideo: Dropping payload (out of sync).
[10448.541596] uvcvideo: Dropping payload (out of sync).
[10448.541602] uvcvideo: Dropping payload (out of sync).
[10448.541605] uvcvideo: Dropping payload (out of sync).
[10448.541613] uvcvideo: frame 205670 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 353249155/353758515/997
[10448.569359] uvcvideo: Frame complete (EOF found).
[10448.569372] uvcvideo: Dropping payload (out of sync).
[10448.569383] uvcvideo: Dropping payload (out of sync).
[10448.569527] uvcvideo: Dropping payload (out of sync).
[10448.569536] uvcvideo: Dropping payload (out of sync).
[10448.569542] uvcvideo: Dropping payload (out of sync).
[10448.569549] uvcvideo: Dropping payload (out of sync).
[10448.569689] uvcvideo: Dropping payload (out of sync).
[10448.569698] uvcvideo: Dropping payload (out of sync).
[10448.569703] uvcvideo: Dropping payload (out of sync).
[10448.569708] uvcvideo: Dropping payload (out of sync).
[10448.569713] uvcvideo: Dropping payload (out of sync).
[10448.569718] uvcvideo: Dropping payload (out of sync).
[10448.569722] uvcvideo: Dropping payload (out of sync).
[10448.569729] uvcvideo: Dropping payload (out of sync).
[10448.569738] uvcvideo: Dropping payload (out of sync).
[10448.569743] uvcvideo: Dropping payload (out of sync).
[10448.569748] uvcvideo: Dropping payload (out of sync).
[10448.569753] uvcvideo: Dropping payload (out of sync).
[10448.569757] uvcvideo: Dropping payload (out of sync).
[10448.569762] uvcvideo: Dropping payload (out of sync).
[10448.569767] uvcvideo: Dropping payload (out of sync).
[10448.569771] uvcvideo: Dropping payload (out of sync).
[10448.569780] uvcvideo: Dropping payload (out of sync).
[10448.569787] uvcvideo: Dropping payload (out of sync).
[10448.569794] uvcvideo: Dropping payload (out of sync).
[10448.569799] uvcvideo: Dropping payload (out of sync).
[10448.569803] uvcvideo: Dropping payload (out of sync).
[10448.569962] uvcvideo: uvc_v4l2_poll
[10448.573372] uvcvideo: Dropping payload (out of sync).
[10448.573382] uvcvideo: Dropping payload (out of sync).
[10448.573388] uvcvideo: Dropping payload (out of sync).
[10448.573526] uvcvideo: Dropping payload (out of sync).
[10448.573535] uvcvideo: Dropping payload (out of sync).
[10448.573540] uvcvideo: Dropping payload (out of sync).
[10448.573544] uvcvideo: Dropping payload (out of sync).
[10448.573549] uvcvideo: Dropping payload (out of sync).
[10448.573554] uvcvideo: Dropping payload (out of sync).
[10448.573558] uvcvideo: Dropping payload (out of sync).
[10448.573563] uvcvideo: Dropping payload (out of sync).
[10448.573571] uvcvideo: Dropping payload (out of sync).
[10448.573576] uvcvideo: Dropping payload (out of sync).
[10448.573581] uvcvideo: Dropping payload (out of sync).
[10448.573585] uvcvideo: Dropping payload (out of sync).
[10448.573590] uvcvideo: Dropping payload (out of sync).
[10448.573595] uvcvideo: Dropping payload (out of sync).
[10448.573601] uvcvideo: Dropping payload (out of sync).
[10448.573738] uvcvideo: Dropping payload (out of sync).
[10448.573746] uvcvideo: Dropping payload (out of sync).
[10448.573751] uvcvideo: Dropping payload (out of sync).
[10448.573894] uvcvideo: Dropping payload (out of sync).
[10448.573899] uvcvideo: Dropping payload (out of sync).
[10448.573907] uvcvideo: Dropping payload (out of sync).
[10448.573911] uvcvideo: Dropping payload (out of sync).
[10448.573920] uvcvideo: frame 205671 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 353749579/354259133/1030
[10448.574285] uvcvideo: uvc_v4l2_poll
[10448.601362] uvcvideo: Frame complete (EOF found).
[10448.601378] uvcvideo: Dropping payload (out of sync).
[10448.601383] uvcvideo: Dropping payload (out of sync).
[10448.601520] uvcvideo: Dropping payload (out of sync).
[10448.601532] uvcvideo: Dropping payload (out of sync).
[10448.601539] uvcvideo: Dropping payload (out of sync).
[10448.601678] uvcvideo: Dropping payload (out of sync).
[10448.601688] uvcvideo: Dropping payload (out of sync).
[10448.601692] uvcvideo: Dropping payload (out of sync).
[10448.601697] uvcvideo: Dropping payload (out of sync).
[10448.601702] uvcvideo: Dropping payload (out of sync).
[10448.601709] uvcvideo: Dropping payload (out of sync).
[10448.601718] uvcvideo: Dropping payload (out of sync).
[10448.601723] uvcvideo: Dropping payload (out of sync).
[10448.601728] uvcvideo: Dropping payload (out of sync).
[10448.601732] uvcvideo: Dropping payload (out of sync).
[10448.601737] uvcvideo: Dropping payload (out of sync).
[10448.601792] uvcvideo: uvc_v4l2_poll
[10448.605374] uvcvideo: Dropping payload (out of sync).
[10448.605384] uvcvideo: Dropping payload (out of sync).
[10448.605390] uvcvideo: Dropping payload (out of sync).
[10448.605528] uvcvideo: Dropping payload (out of sync).
[10448.605534] uvcvideo: Dropping payload (out of sync).
[10448.605539] uvcvideo: Dropping payload (out of sync).
[10448.605544] uvcvideo: Dropping payload (out of sync).
[10448.605548] uvcvideo: Dropping payload (out of sync).
[10448.605553] uvcvideo: Dropping payload (out of sync).
[10448.605559] uvcvideo: Dropping payload (out of sync).
[10448.605565] uvcvideo: Dropping payload (out of sync).
[10448.605573] uvcvideo: Dropping payload (out of sync).
[10448.605578] uvcvideo: Dropping payload (out of sync).
[10448.605583] uvcvideo: Dropping payload (out of sync).
[10448.605591] uvcvideo: Dropping payload (out of sync).
[10448.605596] uvcvideo: Dropping payload (out of sync).
[10448.605600] uvcvideo: Dropping payload (out of sync).
[10448.605605] uvcvideo: Dropping payload (out of sync).
[10448.605609] uvcvideo: Dropping payload (out of sync).
[10448.605618] uvcvideo: Dropping payload (out of sync).
[10448.605623] uvcvideo: Dropping payload (out of sync).
[10448.605628] uvcvideo: Dropping payload (out of sync).
[10448.605632] uvcvideo: Dropping payload (out of sync).
[10448.605637] uvcvideo: Dropping payload (out of sync).
[10448.605642] uvcvideo: Dropping payload (out of sync).
[10448.605646] uvcvideo: Dropping payload (out of sync).
[10448.605787] uvcvideo: Dropping payload (out of sync).
[10448.605793] uvcvideo: Dropping payload (out of sync).
[10448.605797] uvcvideo: Dropping payload (out of sync).
[10448.605802] uvcvideo: Dropping payload (out of sync).
[10448.605805] uvcvideo: Dropping payload (out of sync).
[10448.605810] uvcvideo: Dropping payload (out of sync).
[10448.606173] uvcvideo: uvc_v4l2_poll
[10448.609458] uvcvideo: Dropping payload (out of sync).
[10448.609474] uvcvideo: Dropping payload (out of sync).
[10448.609479] uvcvideo: Dropping payload (out of sync).
[10448.609486] uvcvideo: Dropping payload (out of sync).
[10448.609495] uvcvideo: frame 205672 stats: 0/170/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 354250002/354759750/1064
[10448.633366] uvcvideo: Frame complete (EOF found).
[10448.633380] uvcvideo: Dropping payload (out of sync).
[10448.633391] uvcvideo: Dropping payload (out of sync).
[10448.633553] uvcvideo: Dropping payload (out of sync).
[10448.633558] uvcvideo: Dropping payload (out of sync).
[10448.633565] uvcvideo: Dropping payload (out of sync).
[10448.633723] uvcvideo: Dropping payload (out of sync).
[10448.633776] uvcvideo: uvc_v4l2_poll
[10448.637356] uvcvideo: Dropping payload (out of sync).
[10448.637368] uvcvideo: Dropping payload (out of sync).
[10448.637374] uvcvideo: Dropping payload (out of sync).
[10448.637530] uvcvideo: Dropping payload (out of sync).
[10448.637539] uvcvideo: Dropping payload (out of sync).
[10448.637546] uvcvideo: Dropping payload (out of sync).
[10448.637552] uvcvideo: Dropping payload (out of sync).
[10448.637713] uvcvideo: Dropping payload (out of sync).
[10448.637718] uvcvideo: Dropping payload (out of sync).
[10448.637722] uvcvideo: Dropping payload (out of sync).
[10448.637727] uvcvideo: Dropping payload (out of sync).
[10448.637734] uvcvideo: Dropping payload (out of sync).
[10448.637739] uvcvideo: Dropping payload (out of sync).
[10448.637745] uvcvideo: Dropping payload (out of sync).
[10448.637750] uvcvideo: Dropping payload (out of sync).
[10448.637756] uvcvideo: Dropping payload (out of sync).
[10448.637761] uvcvideo: Dropping payload (out of sync).
[10448.637766] uvcvideo: Dropping payload (out of sync).
[10448.637771] uvcvideo: Dropping payload (out of sync).
[10448.637778] uvcvideo: Dropping payload (out of sync).
[10448.637783] uvcvideo: Dropping payload (out of sync).
[10448.637787] uvcvideo: Dropping payload (out of sync).
[10448.637793] uvcvideo: Dropping payload (out of sync).
[10448.637798] uvcvideo: Dropping payload (out of sync).
[10448.637803] uvcvideo: Dropping payload (out of sync).
[10448.637808] uvcvideo: Dropping payload (out of sync).
[10448.637815] uvcvideo: Dropping payload (out of sync).
[10448.637822] uvcvideo: Dropping payload (out of sync).
[10448.637980] uvcvideo: Dropping payload (out of sync).
[10448.637987] uvcvideo: Dropping payload (out of sync).
[10448.638146] uvcvideo: Dropping payload (out of sync).
[10448.638150] uvcvideo: Dropping payload (out of sync).
[10448.638628] uvcvideo: uvc_v4l2_poll
[10448.641460] uvcvideo: Dropping payload (out of sync).
[10448.641469] uvcvideo: Dropping payload (out of sync).
[10448.641475] uvcvideo: Dropping payload (out of sync).
[10448.641485] uvcvideo: Dropping payload (out of sync).
[10448.641493] uvcvideo: Dropping payload (out of sync).
[10448.641497] uvcvideo: Dropping payload (out of sync).
[10448.641502] uvcvideo: Dropping payload (out of sync).
[10448.641508] uvcvideo: Dropping payload (out of sync).
[10448.641513] uvcvideo: Dropping payload (out of sync).
[10448.641518] uvcvideo: Dropping payload (out of sync).
[10448.641523] uvcvideo: Dropping payload (out of sync).
[10448.641532] uvcvideo: Dropping payload (out of sync).
[10448.641535] uvcvideo: Dropping payload (out of sync).
[10448.641671] uvcvideo: Dropping payload (out of sync).
[10448.641686] uvcvideo: frame 205673 stats: 0/167/266 packets, 0/0/266 pts (!early initial), 265/266 scr, last pts/stc/sof 354750426/355258492/1097
[10448.669359] uvcvideo: Frame complete (EOF found).
[10448.669374] uvcvideo: Dropping payload (out of sync).
[10448.669380] uvcvideo: Dropping payload (out of sync).
[10448.669385] uvcvideo: Dropping payload (out of sync).
[10448.669535] uvcvideo: Dropping payload (out of sync).
[10448.669539] uvcvideo: Dropping payload (out of sync).
[10448.669544] uvcvideo: Dropping payload (out of sync).
[10448.669553] uvcvideo: Dropping payload (out of sync).
[10448.669558] uvcvideo: Dropping payload (out of sync).
[10448.669563] uvcvideo: Dropping payload (out of sync).
[10448.669709] uvcvideo: Dropping payload (out of sync).
[10448.669714] uvcvideo: Dropping payload (out of sync).
[10448.669718] uvcvideo: Dropping payload (out of sync).
[10448.669723] uvcvideo: Dropping payload (out of sync).
[10448.669728] uvcvideo: Dropping payload (out of sync).
[10448.669735] uvcvideo: Dropping payload (out of sync).
[10448.669740] uvcvideo: Dropping payload (out of sync).
[10448.669745] uvcvideo: Dropping payload (out of sync).
[10448.669750] uvcvideo: Dropping payload (out of sync).
[10448.669754] uvcvideo: Dropping payload (out of sync).
[10448.669759] uvcvideo: Dropping payload (out of sync).
[10448.669764] uvcvideo: Dropping payload (out of sync).
[10448.669769] uvcvideo: Dropping payload (out of sync).
[10448.669778] uvcvideo: Dropping payload (out of sync).
[10448.669783] uvcvideo: Dropping payload (out of sync).
[10448.669791] uvcvideo: Dropping payload (out of sync).
[10448.669796] uvcvideo: Dropping payload (out of sync).
[10448.669801] uvcvideo: Dropping payload (out of sync).
[10448.669854] uvcvideo: uvc_v4l2_poll
[10448.673365] uvcvideo: Dropping payload (out of sync).
[10448.673376] uvcvideo: Dropping payload (out of sync).
[10448.673515] uvcvideo: Dropping payload (out of sync).
[10448.673527] uvcvideo: Dropping payload (out of sync).
[10448.673532] uvcvideo: Dropping payload (out of sync).
[10448.673537] uvcvideo: Dropping payload (out of sync).
[10448.673542] uvcvideo: Dropping payload (out of sync).
[10448.673548] uvcvideo: Dropping payload (out of sync).
[10448.673553] uvcvideo: Dropping payload (out of sync).
[10448.673558] uvcvideo: Dropping payload (out of sync).
[10448.673562] uvcvideo: Dropping payload (out of sync).
[10448.673570] uvcvideo: Dropping payload (out of sync).
[10448.673575] uvcvideo: Dropping payload (out of sync).
[10448.673580] uvcvideo: Dropping payload (out of sync).
[10448.673586] uvcvideo: Dropping payload (out of sync).
[10448.673592] uvcvideo: Dropping payload (out of sync).
[10448.673730] uvcvideo: Dropping payload (out of sync).
[10448.673735] uvcvideo: Dropping payload (out of sync).
[10448.673742] uvcvideo: Dropping payload (out of sync).
[10448.673882] uvcvideo: Dropping payload (out of sync).
[10448.673892] uvcvideo: Dropping payload (out of sync).
[10448.673897] uvcvideo: Dropping payload (out of sync).
[10448.673902] uvcvideo: Dropping payload (out of sync).
[10448.673907] uvcvideo: Dropping payload (out of sync).
[10448.673912] uvcvideo: Dropping payload (out of sync).
[10448.673920] uvcvideo: frame 205674 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 355250849/355759109/1130
[10448.674824] uvcvideo: uvc_v4l2_poll
[10448.701363] uvcvideo: Frame complete (EOF found).
[10448.701379] uvcvideo: Dropping payload (out of sync).
[10448.701384] uvcvideo: Dropping payload (out of sync).
[10448.701521] uvcvideo: Dropping payload (out of sync).
[10448.701533] uvcvideo: Dropping payload (out of sync).
[10448.701538] uvcvideo: Dropping payload (out of sync).
[10448.701543] uvcvideo: Dropping payload (out of sync).
[10448.701688] uvcvideo: Dropping payload (out of sync).
[10448.701692] uvcvideo: Dropping payload (out of sync).
[10448.701697] uvcvideo: Dropping payload (out of sync).
[10448.701702] uvcvideo: Dropping payload (out of sync).
[10448.701706] uvcvideo: Dropping payload (out of sync).
[10448.701714] uvcvideo: Dropping payload (out of sync).
[10448.701720] uvcvideo: Dropping payload (out of sync).
[10448.701725] uvcvideo: Dropping payload (out of sync).
[10448.701730] uvcvideo: Dropping payload (out of sync).
[10448.701736] uvcvideo: Dropping payload (out of sync).
[10448.701911] uvcvideo: uvc_v4l2_poll
[10448.705436] uvcvideo: Dropping payload (out of sync).
[10448.705445] uvcvideo: Dropping payload (out of sync).
[10448.705453] uvcvideo: Dropping payload (out of sync).
[10448.705594] uvcvideo: Dropping payload (out of sync).
[10448.705599] uvcvideo: Dropping payload (out of sync).
[10448.705604] uvcvideo: Dropping payload (out of sync).
[10448.705608] uvcvideo: Dropping payload (out of sync).
[10448.705613] uvcvideo: Dropping payload (out of sync).
[10448.705618] uvcvideo: Dropping payload (out of sync).
[10448.705622] uvcvideo: Dropping payload (out of sync).
[10448.705627] uvcvideo: Dropping payload (out of sync).
[10448.705635] uvcvideo: Dropping payload (out of sync).
[10448.705640] uvcvideo: Dropping payload (out of sync).
[10448.705644] uvcvideo: Dropping payload (out of sync).
[10448.705649] uvcvideo: Dropping payload (out of sync).
[10448.705654] uvcvideo: Dropping payload (out of sync).
[10448.705658] uvcvideo: Dropping payload (out of sync).
[10448.705663] uvcvideo: Dropping payload (out of sync).
[10448.705668] uvcvideo: Dropping payload (out of sync).
[10448.705676] uvcvideo: Dropping payload (out of sync).
[10448.705681] uvcvideo: Dropping payload (out of sync).
[10448.705685] uvcvideo: Dropping payload (out of sync).
[10448.705692] uvcvideo: Dropping payload (out of sync).
[10448.705697] uvcvideo: Dropping payload (out of sync).
[10448.705835] uvcvideo: Dropping payload (out of sync).
[10448.705840] uvcvideo: Dropping payload (out of sync).
[10448.705846] uvcvideo: Dropping payload (out of sync).
[10448.705854] uvcvideo: Dropping payload (out of sync).
[10448.705863] uvcvideo: Dropping payload (out of sync).
[10448.705869] uvcvideo: Dropping payload (out of sync).
[10448.706008] uvcvideo: Dropping payload (out of sync).
[10448.706017] uvcvideo: Dropping payload (out of sync).
[10448.706758] uvcvideo: uvc_v4l2_poll
[10448.709493] uvcvideo: Dropping payload (out of sync).
[10448.709501] uvcvideo: Dropping payload (out of sync).
[10448.709508] uvcvideo: Dropping payload (out of sync).
[10448.709518] uvcvideo: Dropping payload (out of sync).
[10448.709527] uvcvideo: frame 205675 stats: 0/166/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 355751273/356259728/1164
[10448.733366] uvcvideo: Frame complete (EOF found).
[10448.733382] uvcvideo: Dropping payload (out of sync).
[10448.733387] uvcvideo: Dropping payload (out of sync).
[10448.733528] uvcvideo: Dropping payload (out of sync).
[10448.733537] uvcvideo: Dropping payload (out of sync).
[10448.733543] uvcvideo: Dropping payload (out of sync).
[10448.733698] uvcvideo: uvc_v4l2_poll
[10448.737357] uvcvideo: Dropping payload (out of sync).
[10448.737369] uvcvideo: Dropping payload (out of sync).
[10448.737375] uvcvideo: Dropping payload (out of sync).
[10448.737513] uvcvideo: Dropping payload (out of sync).
[10448.737517] uvcvideo: Dropping payload (out of sync).
[10448.737522] uvcvideo: Dropping payload (out of sync).
[10448.737529] uvcvideo: Dropping payload (out of sync).
[10448.737534] uvcvideo: Dropping payload (out of sync).
[10448.737673] uvcvideo: Dropping payload (out of sync).
[10448.737678] uvcvideo: Dropping payload (out of sync).
[10448.737682] uvcvideo: Dropping payload (out of sync).
[10448.737690] uvcvideo: Dropping payload (out of sync).
[10448.737695] uvcvideo: Dropping payload (out of sync).
[10448.737701] uvcvideo: Dropping payload (out of sync).
[10448.737706] uvcvideo: Dropping payload (out of sync).
[10448.737710] uvcvideo: Dropping payload (out of sync).
[10448.737714] uvcvideo: Dropping payload (out of sync).
[10448.737719] uvcvideo: Dropping payload (out of sync).
[10448.737723] uvcvideo: Dropping payload (out of sync).
[10448.737735] uvcvideo: Dropping payload (out of sync).
[10448.737739] uvcvideo: Dropping payload (out of sync).
[10448.737747] uvcvideo: Dropping payload (out of sync).
[10448.737752] uvcvideo: Dropping payload (out of sync).
[10448.737756] uvcvideo: Dropping payload (out of sync).
[10448.737761] uvcvideo: Dropping payload (out of sync).
[10448.737766] uvcvideo: Dropping payload (out of sync).
[10448.737771] uvcvideo: Dropping payload (out of sync).
[10448.737779] uvcvideo: Dropping payload (out of sync).
[10448.737801] uvcvideo: Dropping payload (out of sync).
[10448.737808] uvcvideo: Dropping payload (out of sync).
[10448.737813] uvcvideo: Dropping payload (out of sync).
[10448.737818] uvcvideo: Dropping payload (out of sync).
[10448.737991] uvcvideo: uvc_v4l2_poll
[10448.741469] uvcvideo: Dropping payload (out of sync).
[10448.741472] uvcvideo: Dropping payload (out of sync).
[10448.741473] uvcvideo: Dropping payload (out of sync).
[10448.741478] uvcvideo: Dropping payload (out of sync).
[10448.741479] uvcvideo: Dropping payload (out of sync).
[10448.741480] uvcvideo: Dropping payload (out of sync).
[10448.741482] uvcvideo: Dropping payload (out of sync).
[10448.741483] uvcvideo: Dropping payload (out of sync).
[10448.741484] uvcvideo: Dropping payload (out of sync).
[10448.741485] uvcvideo: Dropping payload (out of sync).
[10448.741487] uvcvideo: Dropping payload (out of sync).
[10448.741490] uvcvideo: Dropping payload (out of sync).
[10448.741495] uvcvideo: Dropping payload (out of sync).
[10448.741496] uvcvideo: Dropping payload (out of sync).
[10448.741498] uvcvideo: Dropping payload (out of sync).
[10448.741503] uvcvideo: frame 205676 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 356251696/356760346/1197
[10448.769361] uvcvideo: Frame complete (EOF found).
[10448.769379] uvcvideo: Dropping payload (out of sync).
[10448.769384] uvcvideo: Dropping payload (out of sync).
[10448.769389] uvcvideo: Dropping payload (out of sync).
[10448.769539] uvcvideo: Dropping payload (out of sync).
[10448.769543] uvcvideo: Dropping payload (out of sync).
[10448.769551] uvcvideo: Dropping payload (out of sync).
[10448.769556] uvcvideo: Dropping payload (out of sync).
[10448.769561] uvcvideo: Dropping payload (out of sync).
[10448.769713] uvcvideo: Dropping payload (out of sync).
[10448.769718] uvcvideo: Dropping payload (out of sync).
[10448.769723] uvcvideo: Dropping payload (out of sync).
[10448.769727] uvcvideo: Dropping payload (out of sync).
[10448.769732] uvcvideo: Dropping payload (out of sync).
[10448.769740] uvcvideo: Dropping payload (out of sync).
[10448.769744] uvcvideo: Dropping payload (out of sync).
[10448.769749] uvcvideo: Dropping payload (out of sync).
[10448.769755] uvcvideo: Dropping payload (out of sync).
[10448.769761] uvcvideo: Dropping payload (out of sync).
[10448.769767] uvcvideo: Dropping payload (out of sync).
[10448.769772] uvcvideo: Dropping payload (out of sync).
[10448.769777] uvcvideo: Dropping payload (out of sync).
[10448.769784] uvcvideo: Dropping payload (out of sync).
[10448.769790] uvcvideo: Dropping payload (out of sync).
[10448.769796] uvcvideo: Dropping payload (out of sync).
[10448.769801] uvcvideo: Dropping payload (out of sync).
[10448.769806] uvcvideo: Dropping payload (out of sync).
[10448.769992] uvcvideo: uvc_v4l2_poll
[10448.773462] uvcvideo: Dropping payload (out of sync).
[10448.773472] uvcvideo: Dropping payload (out of sync).
[10448.773478] uvcvideo: Dropping payload (out of sync).
[10448.773616] uvcvideo: Dropping payload (out of sync).
[10448.773621] uvcvideo: Dropping payload (out of sync).
[10448.773625] uvcvideo: Dropping payload (out of sync).
[10448.773630] uvcvideo: Dropping payload (out of sync).
[10448.773635] uvcvideo: Dropping payload (out of sync).
[10448.773639] uvcvideo: Dropping payload (out of sync).
[10448.773644] uvcvideo: Dropping payload (out of sync).
[10448.773649] uvcvideo: Dropping payload (out of sync).
[10448.773657] uvcvideo: Dropping payload (out of sync).
[10448.773661] uvcvideo: Dropping payload (out of sync).
[10448.773666] uvcvideo: Dropping payload (out of sync).
[10448.773671] uvcvideo: Dropping payload (out of sync).
[10448.773675] uvcvideo: Dropping payload (out of sync).
[10448.773680] uvcvideo: Dropping payload (out of sync).
[10448.773685] uvcvideo: Dropping payload (out of sync).
[10448.773689] uvcvideo: Dropping payload (out of sync).
[10448.773828] uvcvideo: Dropping payload (out of sync).
[10448.773849] uvcvideo: Dropping payload (out of sync).
[10448.773853] uvcvideo: Dropping payload (out of sync).
[10448.773860] uvcvideo: Dropping payload (out of sync).
[10448.774000] uvcvideo: Dropping payload (out of sync).
[10448.774004] uvcvideo: Dropping payload (out of sync).
[10448.774009] uvcvideo: Dropping payload (out of sync).
[10448.774018] uvcvideo: frame 205677 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 356752119/357260965/1230
[10448.774381] uvcvideo: uvc_v4l2_poll
[10448.801363] uvcvideo: Frame complete (EOF found).
[10448.801375] uvcvideo: Dropping payload (out of sync).
[10448.801381] uvcvideo: Dropping payload (out of sync).
[10448.801533] uvcvideo: Dropping payload (out of sync).
[10448.801537] uvcvideo: Dropping payload (out of sync).
[10448.801542] uvcvideo: Dropping payload (out of sync).
[10448.801692] uvcvideo: Dropping payload (out of sync).
[10448.801697] uvcvideo: Dropping payload (out of sync).
[10448.801702] uvcvideo: Dropping payload (out of sync).
[10448.801706] uvcvideo: Dropping payload (out of sync).
[10448.801711] uvcvideo: Dropping payload (out of sync).
[10448.801719] uvcvideo: Dropping payload (out of sync).
[10448.801724] uvcvideo: Dropping payload (out of sync).
[10448.801728] uvcvideo: Dropping payload (out of sync).
[10448.801735] uvcvideo: Dropping payload (out of sync).
[10448.801740] uvcvideo: Dropping payload (out of sync).
[10448.801949] uvcvideo: uvc_v4l2_poll
[10448.805365] uvcvideo: Dropping payload (out of sync).
[10448.805371] uvcvideo: Dropping payload (out of sync).
[10448.805376] uvcvideo: Dropping payload (out of sync).
[10448.805383] uvcvideo: Dropping payload (out of sync).
[10448.805388] uvcvideo: Dropping payload (out of sync).
[10448.805394] uvcvideo: Dropping payload (out of sync).
[10448.805399] uvcvideo: Dropping payload (out of sync).
[10448.805404] uvcvideo: Dropping payload (out of sync).
[10448.805409] uvcvideo: Dropping payload (out of sync).
[10448.805413] uvcvideo: Dropping payload (out of sync).
[10448.805418] uvcvideo: Dropping payload (out of sync).
[10448.805425] uvcvideo: Dropping payload (out of sync).
[10448.805430] uvcvideo: Dropping payload (out of sync).
[10448.805436] uvcvideo: Dropping payload (out of sync).
[10448.805579] uvcvideo: Dropping payload (out of sync).
[10448.805591] uvcvideo: Dropping payload (out of sync).
[10448.805598] uvcvideo: Dropping payload (out of sync).
[10448.805743] uvcvideo: Dropping payload (out of sync).
[10448.805748] uvcvideo: Dropping payload (out of sync).
[10448.805756] uvcvideo: Dropping payload (out of sync).
[10448.805761] uvcvideo: Dropping payload (out of sync).
[10448.805766] uvcvideo: Dropping payload (out of sync).
[10448.805771] uvcvideo: Dropping payload (out of sync).
[10448.805775] uvcvideo: Dropping payload (out of sync).
[10448.805780] uvcvideo: Dropping payload (out of sync).
[10448.805785] uvcvideo: Dropping payload (out of sync).
[10448.805788] uvcvideo: Dropping payload (out of sync).
[10448.805795] uvcvideo: Dropping payload (out of sync).
[10448.805798] uvcvideo: Dropping payload (out of sync).
[10448.805803] uvcvideo: Dropping payload (out of sync).
[10448.805807] uvcvideo: Dropping payload (out of sync).
[10448.805812] uvcvideo: Dropping payload (out of sync).
[10448.806857] uvcvideo: uvc_v4l2_poll
[10448.809475] uvcvideo: Dropping payload (out of sync).
[10448.809484] uvcvideo: Dropping payload (out of sync).
[10448.809489] uvcvideo: Dropping payload (out of sync).
[10448.809497] uvcvideo: Dropping payload (out of sync).
[10448.809502] uvcvideo: Dropping payload (out of sync).
[10448.809512] uvcvideo: frame 205678 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 357252543/357761582/1264
[10448.833371] uvcvideo: Frame complete (EOF found).
[10448.833384] uvcvideo: Dropping payload (out of sync).
[10448.833389] uvcvideo: Dropping payload (out of sync).
[10448.833539] uvcvideo: Dropping payload (out of sync).
[10448.833545] uvcvideo: Dropping payload (out of sync).
[10448.833704] uvcvideo: uvc_v4l2_poll
[10448.837360] uvcvideo: Dropping payload (out of sync).
[10448.837372] uvcvideo: Dropping payload (out of sync).
[10448.837378] uvcvideo: Dropping payload (out of sync).
[10448.837534] uvcvideo: Dropping payload (out of sync).
[10448.837544] uvcvideo: Dropping payload (out of sync).
[10448.837550] uvcvideo: Dropping payload (out of sync).
[10448.837556] uvcvideo: Dropping payload (out of sync).
[10448.837712] uvcvideo: Dropping payload (out of sync).
[10448.837717] uvcvideo: Dropping payload (out of sync).
[10448.837722] uvcvideo: Dropping payload (out of sync).
[10448.837726] uvcvideo: Dropping payload (out of sync).
[10448.837734] uvcvideo: Dropping payload (out of sync).
[10448.837739] uvcvideo: Dropping payload (out of sync).
[10448.837745] uvcvideo: Dropping payload (out of sync).
[10448.837750] uvcvideo: Dropping payload (out of sync).
[10448.837756] uvcvideo: Dropping payload (out of sync).
[10448.837762] uvcvideo: Dropping payload (out of sync).
[10448.837766] uvcvideo: Dropping payload (out of sync).
[10448.837771] uvcvideo: Dropping payload (out of sync).
[10448.837779] uvcvideo: Dropping payload (out of sync).
[10448.837784] uvcvideo: Dropping payload (out of sync).
[10448.837787] uvcvideo: Dropping payload (out of sync).
[10448.837792] uvcvideo: Dropping payload (out of sync).
[10448.837796] uvcvideo: Dropping payload (out of sync).
[10448.837800] uvcvideo: Dropping payload (out of sync).
[10448.837806] uvcvideo: Dropping payload (out of sync).
[10448.837810] uvcvideo: Dropping payload (out of sync).
[10448.837818] uvcvideo: Dropping payload (out of sync).
[10448.837823] uvcvideo: Dropping payload (out of sync).
[10448.837828] uvcvideo: Dropping payload (out of sync).
[10448.837833] uvcvideo: Dropping payload (out of sync).
[10448.837839] uvcvideo: Dropping payload (out of sync).
[10448.838563] uvcvideo: uvc_v4l2_poll
[10448.841369] uvcvideo: Dropping payload (out of sync).
[10448.841377] uvcvideo: Dropping payload (out of sync).
[10448.841383] uvcvideo: Dropping payload (out of sync).
[10448.841391] uvcvideo: Dropping payload (out of sync).
[10448.841396] uvcvideo: Dropping payload (out of sync).
[10448.841563] uvcvideo: Dropping payload (out of sync).
[10448.841568] uvcvideo: Dropping payload (out of sync).
[10448.841573] uvcvideo: Dropping payload (out of sync).
[10448.841576] uvcvideo: Dropping payload (out of sync).
[10448.841738] uvcvideo: Dropping payload (out of sync).
[10448.841742] uvcvideo: Dropping payload (out of sync).
[10448.841747] uvcvideo: Dropping payload (out of sync).
[10448.841751] uvcvideo: Dropping payload (out of sync).
[10448.841754] uvcvideo: Dropping payload (out of sync).
[10448.841757] uvcvideo: Dropping payload (out of sync).
[10448.841760] uvcvideo: Dropping payload (out of sync).
[10448.841771] uvcvideo: frame 205679 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 357752966/358262200/1297
[10448.869359] uvcvideo: Frame complete (EOF found).
[10448.869374] uvcvideo: Dropping payload (out of sync).
[10448.869380] uvcvideo: Dropping payload (out of sync).
[10448.869385] uvcvideo: Dropping payload (out of sync).
[10448.869529] uvcvideo: Dropping payload (out of sync).
[10448.869536] uvcvideo: Dropping payload (out of sync).
[10448.869541] uvcvideo: Dropping payload (out of sync).
[10448.869686] uvcvideo: Dropping payload (out of sync).
[10448.869690] uvcvideo: Dropping payload (out of sync).
[10448.869695] uvcvideo: Dropping payload (out of sync).
[10448.869700] uvcvideo: Dropping payload (out of sync).
[10448.869705] uvcvideo: Dropping payload (out of sync).
[10448.869710] uvcvideo: Dropping payload (out of sync).
[10448.869720] uvcvideo: Dropping payload (out of sync).
[10448.869726] uvcvideo: Dropping payload (out of sync).
[10448.869730] uvcvideo: Dropping payload (out of sync).
[10448.869736] uvcvideo: Dropping payload (out of sync).
[10448.869742] uvcvideo: Dropping payload (out of sync).
[10448.869747] uvcvideo: Dropping payload (out of sync).
[10448.869751] uvcvideo: Dropping payload (out of sync).
[10448.869756] uvcvideo: Dropping payload (out of sync).
[10448.869763] uvcvideo: Dropping payload (out of sync).
[10448.869768] uvcvideo: Dropping payload (out of sync).
[10448.869772] uvcvideo: Dropping payload (out of sync).
[10448.869909] uvcvideo: Dropping payload (out of sync).
[10448.869919] uvcvideo: Dropping payload (out of sync).
[10448.870090] uvcvideo: uvc_v4l2_poll
[10448.873393] uvcvideo: Dropping payload (out of sync).
[10448.873410] uvcvideo: Dropping payload (out of sync).
[10448.873416] uvcvideo: Dropping payload (out of sync).
[10448.873553] uvcvideo: Dropping payload (out of sync).
[10448.873563] uvcvideo: Dropping payload (out of sync).
[10448.873568] uvcvideo: Dropping payload (out of sync).
[10448.873572] uvcvideo: Dropping payload (out of sync).
[10448.873577] uvcvideo: Dropping payload (out of sync).
[10448.873584] uvcvideo: Dropping payload (out of sync).
[10448.873590] uvcvideo: Dropping payload (out of sync).
[10448.873595] uvcvideo: Dropping payload (out of sync).
[10448.873601] uvcvideo: Dropping payload (out of sync).
[10448.873606] uvcvideo: Dropping payload (out of sync).
[10448.873611] uvcvideo: Dropping payload (out of sync).
[10448.873616] uvcvideo: Dropping payload (out of sync).
[10448.873620] uvcvideo: Dropping payload (out of sync).
[10448.873625] uvcvideo: Dropping payload (out of sync).
[10448.873631] uvcvideo: Dropping payload (out of sync).
[10448.873768] uvcvideo: Dropping payload (out of sync).
[10448.873781] uvcvideo: Dropping payload (out of sync).
[10448.873787] uvcvideo: Dropping payload (out of sync).
[10448.873796] uvcvideo: Dropping payload (out of sync).
[10448.873801] uvcvideo: Dropping payload (out of sync).
[10448.873808] uvcvideo: Dropping payload (out of sync).
[10448.873949] uvcvideo: Dropping payload (out of sync).
[10448.873956] uvcvideo: Dropping payload (out of sync).
[10448.873961] uvcvideo: Dropping payload (out of sync).
[10448.873971] uvcvideo: frame 205680 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 358253389/358762818/1330
[10448.874357] uvcvideo: uvc_v4l2_poll
[10448.901364] uvcvideo: Frame complete (EOF found).
[10448.901379] uvcvideo: Dropping payload (out of sync).
[10448.901521] uvcvideo: Dropping payload (out of sync).
[10448.901530] uvcvideo: Dropping payload (out of sync).
[10448.901536] uvcvideo: Dropping payload (out of sync).
[10448.901543] uvcvideo: Dropping payload (out of sync).
[10448.901688] uvcvideo: Dropping payload (out of sync).
[10448.901692] uvcvideo: Dropping payload (out of sync).
[10448.901697] uvcvideo: Dropping payload (out of sync).
[10448.901701] uvcvideo: Dropping payload (out of sync).
[10448.901711] uvcvideo: Dropping payload (out of sync).
[10448.901717] uvcvideo: Dropping payload (out of sync).
[10448.901722] uvcvideo: Dropping payload (out of sync).
[10448.901728] uvcvideo: Dropping payload (out of sync).
[10448.901733] uvcvideo: Dropping payload (out of sync).
[10448.901785] uvcvideo: uvc_v4l2_poll
[10448.905434] uvcvideo: Dropping payload (out of sync).
[10448.905447] uvcvideo: Dropping payload (out of sync).
[10448.905454] uvcvideo: Dropping payload (out of sync).
[10448.905591] uvcvideo: Dropping payload (out of sync).
[10448.905596] uvcvideo: Dropping payload (out of sync).
[10448.905601] uvcvideo: Dropping payload (out of sync).
[10448.905605] uvcvideo: Dropping payload (out of sync).
[10448.905610] uvcvideo: Dropping payload (out of sync).
[10448.905614] uvcvideo: Dropping payload (out of sync).
[10448.905621] uvcvideo: Dropping payload (out of sync).
[10448.905626] uvcvideo: Dropping payload (out of sync).
[10448.905634] uvcvideo: Dropping payload (out of sync).
[10448.905639] uvcvideo: Dropping payload (out of sync).
[10448.905644] uvcvideo: Dropping payload (out of sync).
[10448.905648] uvcvideo: Dropping payload (out of sync).
[10448.905654] uvcvideo: Dropping payload (out of sync).
[10448.905659] uvcvideo: Dropping payload (out of sync).
[10448.905663] uvcvideo: Dropping payload (out of sync).
[10448.905668] uvcvideo: Dropping payload (out of sync).
[10448.905676] uvcvideo: Dropping payload (out of sync).
[10448.905681] uvcvideo: Dropping payload (out of sync).
[10448.905685] uvcvideo: Dropping payload (out of sync).
[10448.905825] uvcvideo: Dropping payload (out of sync).
[10448.905831] uvcvideo: Dropping payload (out of sync).
[10448.905836] uvcvideo: Dropping payload (out of sync).
[10448.905841] uvcvideo: Dropping payload (out of sync).
[10448.905847] uvcvideo: Dropping payload (out of sync).
[10448.905992] uvcvideo: Dropping payload (out of sync).
[10448.905997] uvcvideo: Dropping payload (out of sync).
[10448.906001] uvcvideo: Dropping payload (out of sync).
[10448.906007] uvcvideo: Dropping payload (out of sync).
[10448.906011] uvcvideo: Dropping payload (out of sync).
[10448.906607] uvcvideo: uvc_v4l2_poll
[10448.909372] uvcvideo: Dropping payload (out of sync).
[10448.909519] uvcvideo: Dropping payload (out of sync).
[10448.909524] uvcvideo: Dropping payload (out of sync).
[10448.909667] uvcvideo: Dropping payload (out of sync).
[10448.909670] uvcvideo: Dropping payload (out of sync).
[10448.909674] uvcvideo: Dropping payload (out of sync).
[10448.909681] uvcvideo: frame 205681 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 358753813/359263437/1364
[10448.933370] uvcvideo: Frame complete (EOF found).
[10448.933390] uvcvideo: Dropping payload (out of sync).
[10448.933538] uvcvideo: Dropping payload (out of sync).
[10448.933548] uvcvideo: Dropping payload (out of sync).
[10448.933728] uvcvideo: uvc_v4l2_poll
[10448.937359] uvcvideo: Dropping payload (out of sync).
[10448.937370] uvcvideo: Dropping payload (out of sync).
[10448.937376] uvcvideo: Dropping payload (out of sync).
[10448.937524] uvcvideo: Dropping payload (out of sync).
[10448.937531] uvcvideo: Dropping payload (out of sync).
[10448.937535] uvcvideo: Dropping payload (out of sync).
[10448.937680] uvcvideo: Dropping payload (out of sync).
[10448.937685] uvcvideo: Dropping payload (out of sync).
[10448.937690] uvcvideo: Dropping payload (out of sync).
[10448.937694] uvcvideo: Dropping payload (out of sync).
[10448.937699] uvcvideo: Dropping payload (out of sync).
[10448.937707] uvcvideo: Dropping payload (out of sync).
[10448.937712] uvcvideo: Dropping payload (out of sync).
[10448.937716] uvcvideo: Dropping payload (out of sync).
[10448.937721] uvcvideo: Dropping payload (out of sync).
[10448.937728] uvcvideo: Dropping payload (out of sync).
[10448.937733] uvcvideo: Dropping payload (out of sync).
[10448.937739] uvcvideo: Dropping payload (out of sync).
[10448.937744] uvcvideo: Dropping payload (out of sync).
[10448.937752] uvcvideo: Dropping payload (out of sync).
[10448.937757] uvcvideo: Dropping payload (out of sync).
[10448.937761] uvcvideo: Dropping payload (out of sync).
[10448.937766] uvcvideo: Dropping payload (out of sync).
[10448.937771] uvcvideo: Dropping payload (out of sync).
[10448.937778] uvcvideo: Dropping payload (out of sync).
[10448.937783] uvcvideo: Dropping payload (out of sync).
[10448.937787] uvcvideo: Dropping payload (out of sync).
[10448.937793] uvcvideo: Dropping payload (out of sync).
[10448.937797] uvcvideo: Dropping payload (out of sync).
[10448.937802] uvcvideo: Dropping payload (out of sync).
[10448.937807] uvcvideo: Dropping payload (out of sync).
[10448.937812] uvcvideo: Dropping payload (out of sync).
[10448.938661] uvcvideo: uvc_v4l2_poll
[10448.941389] uvcvideo: Dropping payload (out of sync).
[10448.941398] uvcvideo: Dropping payload (out of sync).
[10448.941404] uvcvideo: Dropping payload (out of sync).
[10448.941543] uvcvideo: Dropping payload (out of sync).
[10448.941549] uvcvideo: Dropping payload (out of sync).
[10448.941552] uvcvideo: Dropping payload (out of sync).
[10448.941556] uvcvideo: Dropping payload (out of sync).
[10448.941559] uvcvideo: Dropping payload (out of sync).
[10448.941562] uvcvideo: Dropping payload (out of sync).
[10448.941565] uvcvideo: Dropping payload (out of sync).
[10448.941569] uvcvideo: Dropping payload (out of sync).
[10448.941574] uvcvideo: Dropping payload (out of sync).
[10448.941577] uvcvideo: Dropping payload (out of sync).
[10448.941580] uvcvideo: Dropping payload (out of sync).
[10448.941583] uvcvideo: Dropping payload (out of sync).
[10448.941587] uvcvideo: Dropping payload (out of sync).
[10448.941594] uvcvideo: frame 205682 stats: 0/168/266 packets, 0/0/266 pts (!early initial), 265/266 scr, last pts/stc/sof 359254237/359762179/1397
[10448.969361] uvcvideo: Frame complete (EOF found).
[10448.969375] uvcvideo: Dropping payload (out of sync).
[10448.969382] uvcvideo: Dropping payload (out of sync).
[10448.969386] uvcvideo: Dropping payload (out of sync).
[10448.969529] uvcvideo: Dropping payload (out of sync).
[10448.969541] uvcvideo: Dropping payload (out of sync).
[10448.969548] uvcvideo: Dropping payload (out of sync).
[10448.969555] uvcvideo: Dropping payload (out of sync).
[10448.969559] uvcvideo: Dropping payload (out of sync).
[10448.969703] uvcvideo: Dropping payload (out of sync).
[10448.969714] uvcvideo: Dropping payload (out of sync).
[10448.969718] uvcvideo: Dropping payload (out of sync).
[10448.969723] uvcvideo: Dropping payload (out of sync).
[10448.969731] uvcvideo: Dropping payload (out of sync).
[10448.969736] uvcvideo: Dropping payload (out of sync).
[10448.969741] uvcvideo: Dropping payload (out of sync).
[10448.969745] uvcvideo: Dropping payload (out of sync).
[10448.969750] uvcvideo: Dropping payload (out of sync).
[10448.969755] uvcvideo: Dropping payload (out of sync).
[10448.969761] uvcvideo: Dropping payload (out of sync).
[10448.969767] uvcvideo: Dropping payload (out of sync).
[10448.969775] uvcvideo: Dropping payload (out of sync).
[10448.969780] uvcvideo: Dropping payload (out of sync).
[10448.969788] uvcvideo: Dropping payload (out of sync).
[10448.969792] uvcvideo: Dropping payload (out of sync).
[10448.969797] uvcvideo: Dropping payload (out of sync).
[10448.969977] uvcvideo: uvc_v4l2_poll
[10448.973474] uvcvideo: Dropping payload (out of sync).
[10448.973484] uvcvideo: Dropping payload (out of sync).
[10448.973490] uvcvideo: Dropping payload (out of sync).
[10448.973631] uvcvideo: Dropping payload (out of sync).
[10448.973640] uvcvideo: Dropping payload (out of sync).
[10448.973645] uvcvideo: Dropping payload (out of sync).
[10448.973649] uvcvideo: Dropping payload (out of sync).
[10448.973654] uvcvideo: Dropping payload (out of sync).
[10448.973659] uvcvideo: Dropping payload (out of sync).
[10448.973664] uvcvideo: Dropping payload (out of sync).
[10448.973670] uvcvideo: Dropping payload (out of sync).
[10448.973677] uvcvideo: Dropping payload (out of sync).
[10448.973682] uvcvideo: Dropping payload (out of sync).
[10448.973687] uvcvideo: Dropping payload (out of sync).
[10448.973692] uvcvideo: Dropping payload (out of sync).
[10448.973696] uvcvideo: Dropping payload (out of sync).
[10448.973701] uvcvideo: Dropping payload (out of sync).
[10448.973707] uvcvideo: Dropping payload (out of sync).
[10448.973845] uvcvideo: Dropping payload (out of sync).
[10448.973854] uvcvideo: Dropping payload (out of sync).
[10448.973859] uvcvideo: Dropping payload (out of sync).
[10448.973865] uvcvideo: Dropping payload (out of sync).
[10448.973872] uvcvideo: Dropping payload (out of sync).
[10448.974013] uvcvideo: Dropping payload (out of sync).
[10448.974028] uvcvideo: Dropping payload (out of sync).
[10448.974032] uvcvideo: Dropping payload (out of sync).
[10448.974037] uvcvideo: Dropping payload (out of sync).
[10448.974047] uvcvideo: frame 205683 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 359754660/360262797/1430
[10448.974616] uvcvideo: uvc_v4l2_poll
[10449.001365] uvcvideo: Frame complete (EOF found).
[10449.001381] uvcvideo: Dropping payload (out of sync).
[10449.001389] uvcvideo: Dropping payload (out of sync).
[10449.001550] uvcvideo: Dropping payload (out of sync).
[10449.001556] uvcvideo: Dropping payload (out of sync).
[10449.001562] uvcvideo: Dropping payload (out of sync).
[10449.001720] uvcvideo: Dropping payload (out of sync).
[10449.001725] uvcvideo: Dropping payload (out of sync).
[10449.001730] uvcvideo: Dropping payload (out of sync).
[10449.001735] uvcvideo: Dropping payload (out of sync).
[10449.001742] uvcvideo: Dropping payload (out of sync).
[10449.001747] uvcvideo: Dropping payload (out of sync).
[10449.001752] uvcvideo: Dropping payload (out of sync).
[10449.001757] uvcvideo: Dropping payload (out of sync).
[10449.001761] uvcvideo: Dropping payload (out of sync).
[10449.001812] uvcvideo: uvc_v4l2_poll
[10449.005467] uvcvideo: Dropping payload (out of sync).
[10449.005477] uvcvideo: Dropping payload (out of sync).
[10449.005483] uvcvideo: Dropping payload (out of sync).
[10449.005639] uvcvideo: Dropping payload (out of sync).
[10449.005648] uvcvideo: Dropping payload (out of sync).
[10449.005653] uvcvideo: Dropping payload (out of sync).
[10449.005657] uvcvideo: Dropping payload (out of sync).
[10449.005662] uvcvideo: Dropping payload (out of sync).
[10449.005668] uvcvideo: Dropping payload (out of sync).
[10449.005673] uvcvideo: Dropping payload (out of sync).
[10449.005678] uvcvideo: Dropping payload (out of sync).
[10449.005686] uvcvideo: Dropping payload (out of sync).
[10449.005691] uvcvideo: Dropping payload (out of sync).
[10449.005695] uvcvideo: Dropping payload (out of sync).
[10449.005700] uvcvideo: Dropping payload (out of sync).
[10449.005705] uvcvideo: Dropping payload (out of sync).
[10449.005711] uvcvideo: Dropping payload (out of sync).
[10449.005717] uvcvideo: Dropping payload (out of sync).
[10449.005873] uvcvideo: Dropping payload (out of sync).
[10449.005881] uvcvideo: Dropping payload (out of sync).
[10449.005886] uvcvideo: Dropping payload (out of sync).
[10449.005890] uvcvideo: Dropping payload (out of sync).
[10449.005895] uvcvideo: Dropping payload (out of sync).
[10449.005899] uvcvideo: Dropping payload (out of sync).
[10449.006054] uvcvideo: Dropping payload (out of sync).
[10449.006059] uvcvideo: Dropping payload (out of sync).
[10449.006065] uvcvideo: Dropping payload (out of sync).
[10449.006073] uvcvideo: Dropping payload (out of sync).
[10449.006079] uvcvideo: Dropping payload (out of sync).
[10449.006084] uvcvideo: Dropping payload (out of sync).
[10449.006089] uvcvideo: Dropping payload (out of sync).
[10449.006095] uvcvideo: Dropping payload (out of sync).
[10449.006476] uvcvideo: uvc_v4l2_poll
[10449.009465] uvcvideo: Dropping payload (out of sync).
[10449.009475] uvcvideo: Dropping payload (out of sync).
[10449.009480] uvcvideo: Dropping payload (out of sync).
[10449.009642] uvcvideo: Dropping payload (out of sync).
[10449.009646] uvcvideo: Dropping payload (out of sync).
[10449.009649] uvcvideo: Dropping payload (out of sync).
[10449.009656] uvcvideo: frame 205684 stats: 0/166/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 360255084/360763415/1464
[10449.033370] uvcvideo: Frame complete (EOF found).
[10449.033386] uvcvideo: Dropping payload (out of sync).
[10449.033392] uvcvideo: Dropping payload (out of sync).
[10449.033553] uvcvideo: Dropping payload (out of sync).
[10449.033741] uvcvideo: uvc_v4l2_poll
[10449.037357] uvcvideo: Dropping payload (out of sync).
[10449.037368] uvcvideo: Dropping payload (out of sync).
[10449.037374] uvcvideo: Dropping payload (out of sync).
[10449.037530] uvcvideo: Dropping payload (out of sync).
[10449.037540] uvcvideo: Dropping payload (out of sync).
[10449.037545] uvcvideo: Dropping payload (out of sync).
[10449.037552] uvcvideo: Dropping payload (out of sync).
[10449.037710] uvcvideo: Dropping payload (out of sync).
[10449.037714] uvcvideo: Dropping payload (out of sync).
[10449.037719] uvcvideo: Dropping payload (out of sync).
[10449.037724] uvcvideo: Dropping payload (out of sync).
[10449.037731] uvcvideo: Dropping payload (out of sync).
[10449.037737] uvcvideo: Dropping payload (out of sync).
[10449.037742] uvcvideo: Dropping payload (out of sync).
[10449.037748] uvcvideo: Dropping payload (out of sync).
[10449.037755] uvcvideo: Dropping payload (out of sync).
[10449.037759] uvcvideo: Dropping payload (out of sync).
[10449.037764] uvcvideo: Dropping payload (out of sync).
[10449.037771] uvcvideo: Dropping payload (out of sync).
[10449.037778] uvcvideo: Dropping payload (out of sync).
[10449.037783] uvcvideo: Dropping payload (out of sync).
[10449.037786] uvcvideo: Dropping payload (out of sync).
[10449.037790] uvcvideo: Dropping payload (out of sync).
[10449.037793] uvcvideo: Dropping payload (out of sync).
[10449.037797] uvcvideo: Dropping payload (out of sync).
[10449.037802] uvcvideo: Dropping payload (out of sync).
[10449.037807] uvcvideo: Dropping payload (out of sync).
[10449.037815] uvcvideo: Dropping payload (out of sync).
[10449.037971] uvcvideo: Dropping payload (out of sync).
[10449.037978] uvcvideo: Dropping payload (out of sync).
[10449.038137] uvcvideo: Dropping payload (out of sync).
[10449.038142] uvcvideo: Dropping payload (out of sync).
[10449.038402] uvcvideo: uvc_v4l2_poll
[10449.041469] uvcvideo: Dropping payload (out of sync).
[10449.041476] uvcvideo: Dropping payload (out of sync).
[10449.041481] uvcvideo: Dropping payload (out of sync).
[10449.041488] uvcvideo: Dropping payload (out of sync).
[10449.041493] uvcvideo: Dropping payload (out of sync).
[10449.041498] uvcvideo: Dropping payload (out of sync).
[10449.041503] uvcvideo: Dropping payload (out of sync).
[10449.041509] uvcvideo: Dropping payload (out of sync).
[10449.041514] uvcvideo: Dropping payload (out of sync).
[10449.041519] uvcvideo: Dropping payload (out of sync).
[10449.041523] uvcvideo: Dropping payload (out of sync).
[10449.041531] uvcvideo: Dropping payload (out of sync).
[10449.041536] uvcvideo: Dropping payload (out of sync).
[10449.041541] uvcvideo: Dropping payload (out of sync).
[10449.041547] uvcvideo: Dropping payload (out of sync).
[10449.041685] uvcvideo: Dropping payload (out of sync).
[10449.041690] uvcvideo: Dropping payload (out of sync).
[10449.041700] uvcvideo: frame 205685 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 360755507/361264033/1497
[10449.069361] uvcvideo: Frame complete (EOF found).
[10449.069376] uvcvideo: Dropping payload (out of sync).
[10449.069382] uvcvideo: Dropping payload (out of sync).
[10449.069389] uvcvideo: Dropping payload (out of sync).
[10449.069554] uvcvideo: Dropping payload (out of sync).
[10449.069559] uvcvideo: Dropping payload (out of sync).
[10449.069564] uvcvideo: Dropping payload (out of sync).
[10449.069715] uvcvideo: Dropping payload (out of sync).
[10449.069719] uvcvideo: Dropping payload (out of sync).
[10449.069724] uvcvideo: Dropping payload (out of sync).
[10449.069729] uvcvideo: Dropping payload (out of sync).
[10449.069734] uvcvideo: Dropping payload (out of sync).
[10449.069741] uvcvideo: Dropping payload (out of sync).
[10449.069748] uvcvideo: Dropping payload (out of sync).
[10449.069753] uvcvideo: Dropping payload (out of sync).
[10449.069757] uvcvideo: Dropping payload (out of sync).
[10449.069762] uvcvideo: Dropping payload (out of sync).
[10449.069768] uvcvideo: Dropping payload (out of sync).
[10449.069773] uvcvideo: Dropping payload (out of sync).
[10449.069778] uvcvideo: Dropping payload (out of sync).
[10449.069785] uvcvideo: Dropping payload (out of sync).
[10449.069791] uvcvideo: Dropping payload (out of sync).
[10449.069795] uvcvideo: Dropping payload (out of sync).
[10449.069800] uvcvideo: Dropping payload (out of sync).
[10449.069804] uvcvideo: Dropping payload (out of sync).
[10449.069975] uvcvideo: uvc_v4l2_poll
[10449.073361] uvcvideo: Dropping payload (out of sync).
[10449.073365] uvcvideo: Dropping payload (out of sync).
[10449.073366] uvcvideo: Dropping payload (out of sync).
[10449.073370] uvcvideo: Dropping payload (out of sync).
[10449.073372] uvcvideo: Dropping payload (out of sync).
[10449.073375] uvcvideo: Dropping payload (out of sync).
[10449.073377] uvcvideo: Dropping payload (out of sync).
[10449.073378] uvcvideo: Dropping payload (out of sync).
[10449.073533] uvcvideo: Dropping payload (out of sync).
[10449.073534] uvcvideo: Dropping payload (out of sync).
[10449.073536] uvcvideo: Dropping payload (out of sync).
[10449.073544] uvcvideo: Dropping payload (out of sync).
[10449.073546] uvcvideo: Dropping payload (out of sync).
[10449.073548] uvcvideo: Dropping payload (out of sync).
[10449.073549] uvcvideo: Dropping payload (out of sync).
[10449.073551] uvcvideo: Dropping payload (out of sync).
[10449.073552] uvcvideo: Dropping payload (out of sync).
[10449.073553] uvcvideo: Dropping payload (out of sync).
[10449.073555] uvcvideo: Dropping payload (out of sync).
[10449.073558] uvcvideo: Dropping payload (out of sync).
[10449.073560] uvcvideo: Dropping payload (out of sync).
[10449.073561] uvcvideo: Dropping payload (out of sync).
[10449.073562] uvcvideo: Dropping payload (out of sync).
[10449.073565] uvcvideo: Dropping payload (out of sync).
[10449.073566] uvcvideo: Dropping payload (out of sync).
[10449.073568] uvcvideo: Dropping payload (out of sync).
[10449.073570] uvcvideo: Dropping payload (out of sync).
[10449.073574] uvcvideo: Dropping payload (out of sync).
[10449.073580] uvcvideo: frame 205686 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 361255930/361764651/1531
[10449.074647] uvcvideo: uvc_v4l2_poll
[10449.101365] uvcvideo: Frame complete (EOF found).
[10449.101380] uvcvideo: Dropping payload (out of sync).
[10449.101383] uvcvideo: Dropping payload (out of sync).
[10449.101386] uvcvideo: Dropping payload (out of sync).
[10449.101529] uvcvideo: Dropping payload (out of sync).
[10449.101533] uvcvideo: Dropping payload (out of sync).
[10449.101535] uvcvideo: Dropping payload (out of sync).
[10449.101538] uvcvideo: Dropping payload (out of sync).
[10449.101541] uvcvideo: Dropping payload (out of sync).
[10449.101551] uvcvideo: Dropping payload (out of sync).
[10449.101556] uvcvideo: Dropping payload (out of sync).
[10449.101559] uvcvideo: Dropping payload (out of sync).
[10449.101561] uvcvideo: Dropping payload (out of sync).
[10449.101564] uvcvideo: Dropping payload (out of sync).
[10449.101768] uvcvideo: uvc_v4l2_poll
[10449.105476] uvcvideo: Dropping payload (out of sync).
[10449.105486] uvcvideo: Dropping payload (out of sync).
[10449.105492] uvcvideo: Dropping payload (out of sync).
[10449.105629] uvcvideo: Dropping payload (out of sync).
[10449.105638] uvcvideo: Dropping payload (out of sync).
[10449.105643] uvcvideo: Dropping payload (out of sync).
[10449.105648] uvcvideo: Dropping payload (out of sync).
[10449.105652] uvcvideo: Dropping payload (out of sync).
[10449.105659] uvcvideo: Dropping payload (out of sync).
[10449.105665] uvcvideo: Dropping payload (out of sync).
[10449.105670] uvcvideo: Dropping payload (out of sync).
[10449.105677] uvcvideo: Dropping payload (out of sync).
[10449.105681] uvcvideo: Dropping payload (out of sync).
[10449.105686] uvcvideo: Dropping payload (out of sync).
[10449.105691] uvcvideo: Dropping payload (out of sync).
[10449.105695] uvcvideo: Dropping payload (out of sync).
[10449.105700] uvcvideo: Dropping payload (out of sync).
[10449.105705] uvcvideo: Dropping payload (out of sync).
[10449.105709] uvcvideo: Dropping payload (out of sync).
[10449.105852] uvcvideo: Dropping payload (out of sync).
[10449.105855] uvcvideo: Dropping payload (out of sync).
[10449.105858] uvcvideo: Dropping payload (out of sync).
[10449.105861] uvcvideo: Dropping payload (out of sync).
[10449.105865] uvcvideo: Dropping payload (out of sync).
[10449.105870] uvcvideo: Dropping payload (out of sync).
[10449.105874] uvcvideo: Dropping payload (out of sync).
[10449.105877] uvcvideo: Dropping payload (out of sync).
[10449.106023] uvcvideo: Dropping payload (out of sync).
[10449.106026] uvcvideo: Dropping payload (out of sync).
[10449.106029] uvcvideo: Dropping payload (out of sync).
[10449.106032] uvcvideo: Dropping payload (out of sync).
[10449.106035] uvcvideo: Dropping payload (out of sync).
[10449.106730] uvcvideo: uvc_v4l2_poll
[10449.109471] uvcvideo: Dropping payload (out of sync).
[10449.109475] uvcvideo: Dropping payload (out of sync).
[10449.109477] uvcvideo: Dropping payload (out of sync).
[10449.109484] uvcvideo: Dropping payload (out of sync).
[10449.109485] uvcvideo: Dropping payload (out of sync).
[10449.109486] uvcvideo: Dropping payload (out of sync).
[10449.109623] uvcvideo: Dropping payload (out of sync).
[10449.109629] uvcvideo: frame 205687 stats: 0/170/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 361756354/362265268/1564
[10449.133372] uvcvideo: Frame complete (EOF found).
[10449.133388] uvcvideo: Dropping payload (out of sync).
[10449.133395] uvcvideo: Dropping payload (out of sync).
[10449.133553] uvcvideo: uvc_v4l2_poll
[10449.137359] uvcvideo: Dropping payload (out of sync).
[10449.137372] uvcvideo: Dropping payload (out of sync).
[10449.137378] uvcvideo: Dropping payload (out of sync).
[10449.137516] uvcvideo: Dropping payload (out of sync).
[10449.137525] uvcvideo: Dropping payload (out of sync).
[10449.137530] uvcvideo: Dropping payload (out of sync).
[10449.137536] uvcvideo: Dropping payload (out of sync).
[10449.137542] uvcvideo: Dropping payload (out of sync).
[10449.137547] uvcvideo: Dropping payload (out of sync).
[10449.137687] uvcvideo: Dropping payload (out of sync).
[10449.137696] uvcvideo: Dropping payload (out of sync).
[10449.137703] uvcvideo: Dropping payload (out of sync).
[10449.137708] uvcvideo: Dropping payload (out of sync).
[10449.137713] uvcvideo: Dropping payload (out of sync).
[10449.137718] uvcvideo: Dropping payload (out of sync).
[10449.137723] uvcvideo: Dropping payload (out of sync).
[10449.137727] uvcvideo: Dropping payload (out of sync).
[10449.137732] uvcvideo: Dropping payload (out of sync).
[10449.137736] uvcvideo: Dropping payload (out of sync).
[10449.137744] uvcvideo: Dropping payload (out of sync).
[10449.137752] uvcvideo: Dropping payload (out of sync).
[10449.137755] uvcvideo: Dropping payload (out of sync).
[10449.137759] uvcvideo: Dropping payload (out of sync).
[10449.137766] uvcvideo: Dropping payload (out of sync).
[10449.137770] uvcvideo: Dropping payload (out of sync).
[10449.137775] uvcvideo: Dropping payload (out of sync).
[10449.137780] uvcvideo: Dropping payload (out of sync).
[10449.137786] uvcvideo: Dropping payload (out of sync).
[10449.137793] uvcvideo: Dropping payload (out of sync).
[10449.137798] uvcvideo: Dropping payload (out of sync).
[10449.137802] uvcvideo: Dropping payload (out of sync).
[10449.137807] uvcvideo: Dropping payload (out of sync).
[10449.138520] uvcvideo: uvc_v4l2_poll
[10449.141387] uvcvideo: Dropping payload (out of sync).
[10449.141393] uvcvideo: Dropping payload (out of sync).
[10449.141398] uvcvideo: Dropping payload (out of sync).
[10449.141406] uvcvideo: Dropping payload (out of sync).
[10449.141410] uvcvideo: Dropping payload (out of sync).
[10449.141416] uvcvideo: Dropping payload (out of sync).
[10449.141421] uvcvideo: Dropping payload (out of sync).
[10449.141427] uvcvideo: Dropping payload (out of sync).
[10449.141431] uvcvideo: Dropping payload (out of sync).
[10449.141436] uvcvideo: Dropping payload (out of sync).
[10449.141441] uvcvideo: Dropping payload (out of sync).
[10449.141446] uvcvideo: Dropping payload (out of sync).
[10449.141449] uvcvideo: Dropping payload (out of sync).
[10449.141453] uvcvideo: Dropping payload (out of sync).
[10449.141461] uvcvideo: Dropping payload (out of sync).
[10449.141464] uvcvideo: Dropping payload (out of sync).
[10449.141600] uvcvideo: Dropping payload (out of sync).
[10449.141604] uvcvideo: Dropping payload (out of sync).
[10449.141615] uvcvideo: frame 205688 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 362256777/362765887/1597
[10449.169361] uvcvideo: Frame complete (EOF found).
[10449.169375] uvcvideo: Dropping payload (out of sync).
[10449.169381] uvcvideo: Dropping payload (out of sync).
[10449.169388] uvcvideo: Dropping payload (out of sync).
[10449.169393] uvcvideo: Dropping payload (out of sync).
[10449.169536] uvcvideo: Dropping payload (out of sync).
[10449.169542] uvcvideo: Dropping payload (out of sync).
[10449.169548] uvcvideo: Dropping payload (out of sync).
[10449.169693] uvcvideo: Dropping payload (out of sync).
[10449.169698] uvcvideo: Dropping payload (out of sync).
[10449.169703] uvcvideo: Dropping payload (out of sync).
[10449.169711] uvcvideo: Dropping payload (out of sync).
[10449.169716] uvcvideo: Dropping payload (out of sync).
[10449.169721] uvcvideo: Dropping payload (out of sync).
[10449.169726] uvcvideo: Dropping payload (out of sync).
[10449.169735] uvcvideo: Dropping payload (out of sync).
[10449.169745] uvcvideo: Dropping payload (out of sync).
[10449.169749] uvcvideo: Dropping payload (out of sync).
[10449.169755] uvcvideo: Dropping payload (out of sync).
[10449.169764] uvcvideo: Dropping payload (out of sync).
[10449.169769] uvcvideo: Dropping payload (out of sync).
[10449.169773] uvcvideo: Dropping payload (out of sync).
[10449.169779] uvcvideo: Dropping payload (out of sync).
[10449.169783] uvcvideo: Dropping payload (out of sync).
[10449.169956] uvcvideo: uvc_v4l2_poll
[10449.173391] uvcvideo: Dropping payload (out of sync).
[10449.173405] uvcvideo: Dropping payload (out of sync).
[10449.173411] uvcvideo: Dropping payload (out of sync).
[10449.173550] uvcvideo: Dropping payload (out of sync).
[10449.173559] uvcvideo: Dropping payload (out of sync).
[10449.173564] uvcvideo: Dropping payload (out of sync).
[10449.173568] uvcvideo: Dropping payload (out of sync).
[10449.173574] uvcvideo: Dropping payload (out of sync).
[10449.173580] uvcvideo: Dropping payload (out of sync).
[10449.173586] uvcvideo: Dropping payload (out of sync).
[10449.173592] uvcvideo: Dropping payload (out of sync).
[10449.173600] uvcvideo: Dropping payload (out of sync).
[10449.173605] uvcvideo: Dropping payload (out of sync).
[10449.173610] uvcvideo: Dropping payload (out of sync).
[10449.173616] uvcvideo: Dropping payload (out of sync).
[10449.173621] uvcvideo: Dropping payload (out of sync).
[10449.173625] uvcvideo: Dropping payload (out of sync).
[10449.173630] uvcvideo: Dropping payload (out of sync).
[10449.173635] uvcvideo: Dropping payload (out of sync).
[10449.173642] uvcvideo: Dropping payload (out of sync).
[10449.173648] uvcvideo: Dropping payload (out of sync).
[10449.173786] uvcvideo: Dropping payload (out of sync).
[10449.173790] uvcvideo: Dropping payload (out of sync).
[10449.173794] uvcvideo: Dropping payload (out of sync).
[10449.173800] uvcvideo: Dropping payload (out of sync).
[10449.173807] uvcvideo: Dropping payload (out of sync).
[10449.173815] uvcvideo: Dropping payload (out of sync).
[10449.173956] uvcvideo: Dropping payload (out of sync).
[10449.173960] uvcvideo: Dropping payload (out of sync).
[10449.173971] uvcvideo: frame 205689 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 362757201/363266504/1631
[10449.174347] uvcvideo: uvc_v4l2_poll
[10449.201369] uvcvideo: Frame complete (EOF found).
[10449.201373] uvcvideo: Dropping payload (out of sync).
[10449.201374] uvcvideo: Dropping payload (out of sync).
[10449.201375] uvcvideo: Dropping payload (out of sync).
[10449.201376] uvcvideo: Dropping payload (out of sync).
[10449.201377] uvcvideo: Dropping payload (out of sync).
[10449.201378] uvcvideo: Dropping payload (out of sync).
[10449.201379] uvcvideo: Dropping payload (out of sync).
[10449.201383] uvcvideo: Dropping payload (out of sync).
[10449.201384] uvcvideo: Dropping payload (out of sync).
[10449.201384] uvcvideo: Dropping payload (out of sync).
[10449.201385] uvcvideo: Dropping payload (out of sync).
[10449.201386] uvcvideo: Dropping payload (out of sync).
[10449.201438] uvcvideo: uvc_v4l2_poll
[10449.205369] uvcvideo: Dropping payload (out of sync).
[10449.205373] uvcvideo: Dropping payload (out of sync).
[10449.205375] uvcvideo: Dropping payload (out of sync).
[10449.205380] uvcvideo: Dropping payload (out of sync).
[10449.205382] uvcvideo: Dropping payload (out of sync).
[10449.205383] uvcvideo: Dropping payload (out of sync).
[10449.205385] uvcvideo: Dropping payload (out of sync).
[10449.205386] uvcvideo: Dropping payload (out of sync).
[10449.205387] uvcvideo: Dropping payload (out of sync).
[10449.205388] uvcvideo: Dropping payload (out of sync).
[10449.205389] uvcvideo: Dropping payload (out of sync).
[10449.205392] uvcvideo: Dropping payload (out of sync).
[10449.205393] uvcvideo: Dropping payload (out of sync).
[10449.205395] uvcvideo: Dropping payload (out of sync).
[10449.205397] uvcvideo: Dropping payload (out of sync).
[10449.205398] uvcvideo: Dropping payload (out of sync).
[10449.205399] uvcvideo: Dropping payload (out of sync).
[10449.205400] uvcvideo: Dropping payload (out of sync).
[10449.205401] uvcvideo: Dropping payload (out of sync).
[10449.205540] uvcvideo: Dropping payload (out of sync).
[10449.205541] uvcvideo: Dropping payload (out of sync).
[10449.205542] uvcvideo: Dropping payload (out of sync).
[10449.205543] uvcvideo: Dropping payload (out of sync).
[10449.205546] uvcvideo: Dropping payload (out of sync).
[10449.205547] uvcvideo: Dropping payload (out of sync).
[10449.205551] uvcvideo: Dropping payload (out of sync).
[10449.205552] uvcvideo: Dropping payload (out of sync).
[10449.205555] uvcvideo: Dropping payload (out of sync).
[10449.205556] uvcvideo: Dropping payload (out of sync).
[10449.205557] uvcvideo: Dropping payload (out of sync).
[10449.205558] uvcvideo: Dropping payload (out of sync).
[10449.205559] uvcvideo: Dropping payload (out of sync).
[10449.206218] uvcvideo: uvc_v4l2_poll
[10449.209484] uvcvideo: Dropping payload (out of sync).
[10449.209487] uvcvideo: Dropping payload (out of sync).
[10449.209489] uvcvideo: Dropping payload (out of sync).
[10449.209492] uvcvideo: Dropping payload (out of sync).
[10449.209493] uvcvideo: Dropping payload (out of sync).
[10449.209494] uvcvideo: Dropping payload (out of sync).
[10449.209495] uvcvideo: Dropping payload (out of sync).
[10449.209496] uvcvideo: Dropping payload (out of sync).
[10449.209502] uvcvideo: frame 205690 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 363257624/363767120/1664
[10449.233373] uvcvideo: Frame complete (EOF found).
[10449.233377] uvcvideo: Dropping payload (out of sync).
[10449.233432] uvcvideo: uvc_v4l2_poll
[10449.237361] uvcvideo: Dropping payload (out of sync).
[10449.237373] uvcvideo: Dropping payload (out of sync).
[10449.237513] uvcvideo: Dropping payload (out of sync).
[10449.237526] uvcvideo: Dropping payload (out of sync).
[10449.237533] uvcvideo: Dropping payload (out of sync).
[10449.237673] uvcvideo: Dropping payload (out of sync).
[10449.237682] uvcvideo: Dropping payload (out of sync).
[10449.237687] uvcvideo: Dropping payload (out of sync).
[10449.237691] uvcvideo: Dropping payload (out of sync).
[10449.237696] uvcvideo: Dropping payload (out of sync).
[10449.237701] uvcvideo: Dropping payload (out of sync).
[10449.237708] uvcvideo: Dropping payload (out of sync).
[10449.237715] uvcvideo: Dropping payload (out of sync).
[10449.237720] uvcvideo: Dropping payload (out of sync).
[10449.237725] uvcvideo: Dropping payload (out of sync).
[10449.237730] uvcvideo: Dropping payload (out of sync).
[10449.237734] uvcvideo: Dropping payload (out of sync).
[10449.237739] uvcvideo: Dropping payload (out of sync).
[10449.237744] uvcvideo: Dropping payload (out of sync).
[10449.237751] uvcvideo: Dropping payload (out of sync).
[10449.237756] uvcvideo: Dropping payload (out of sync).
[10449.237761] uvcvideo: Dropping payload (out of sync).
[10449.237900] uvcvideo: Dropping payload (out of sync).
[10449.237915] uvcvideo: Dropping payload (out of sync).
[10449.237923] uvcvideo: Dropping payload (out of sync).
[10449.238063] uvcvideo: Dropping payload (out of sync).
[10449.238071] uvcvideo: Dropping payload (out of sync).
[10449.238078] uvcvideo: Dropping payload (out of sync).
[10449.238084] uvcvideo: Dropping payload (out of sync).
[10449.238090] uvcvideo: Dropping payload (out of sync).
[10449.238095] uvcvideo: Dropping payload (out of sync).
[10449.238101] uvcvideo: Dropping payload (out of sync).
[10449.238447] uvcvideo: uvc_v4l2_poll
[10449.241426] uvcvideo: Dropping payload (out of sync).
[10449.241440] uvcvideo: Dropping payload (out of sync).
[10449.241447] uvcvideo: Dropping payload (out of sync).
[10449.241585] uvcvideo: Dropping payload (out of sync).
[10449.241596] uvcvideo: Dropping payload (out of sync).
[10449.241600] uvcvideo: Dropping payload (out of sync).
[10449.241605] uvcvideo: Dropping payload (out of sync).
[10449.241610] uvcvideo: Dropping payload (out of sync).
[10449.241617] uvcvideo: Dropping payload (out of sync).
[10449.241623] uvcvideo: Dropping payload (out of sync).
[10449.241628] uvcvideo: Dropping payload (out of sync).
[10449.241636] uvcvideo: Dropping payload (out of sync).
[10449.241641] uvcvideo: Dropping payload (out of sync).
[10449.241647] uvcvideo: Dropping payload (out of sync).
[10449.241652] uvcvideo: Dropping payload (out of sync).
[10449.241657] uvcvideo: Dropping payload (out of sync).
[10449.241661] uvcvideo: Dropping payload (out of sync).
[10449.241666] uvcvideo: Dropping payload (out of sync).
[10449.241671] uvcvideo: Dropping payload (out of sync).
[10449.241681] uvcvideo: frame 205691 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 363758048/364267739/1697
[10449.269362] uvcvideo: Frame complete (EOF found).
[10449.269378] uvcvideo: Dropping payload (out of sync).
[10449.269387] uvcvideo: Dropping payload (out of sync).
[10449.269555] uvcvideo: Dropping payload (out of sync).
[10449.269560] uvcvideo: Dropping payload (out of sync).
[10449.269566] uvcvideo: Dropping payload (out of sync).
[10449.269571] uvcvideo: Dropping payload (out of sync).
[10449.269575] uvcvideo: Dropping payload (out of sync).
[10449.269741] uvcvideo: Dropping payload (out of sync).
[10449.269746] uvcvideo: Dropping payload (out of sync).
[10449.269753] uvcvideo: Dropping payload (out of sync).
[10449.269759] uvcvideo: Dropping payload (out of sync).
[10449.269763] uvcvideo: Dropping payload (out of sync).
[10449.269768] uvcvideo: Dropping payload (out of sync).
[10449.269772] uvcvideo: Dropping payload (out of sync).
[10449.269777] uvcvideo: Dropping payload (out of sync).
[10449.269790] uvcvideo: Dropping payload (out of sync).
[10449.269794] uvcvideo: Dropping payload (out of sync).
[10449.269801] uvcvideo: Dropping payload (out of sync).
[10449.269807] uvcvideo: Dropping payload (out of sync).
[10449.269812] uvcvideo: Dropping payload (out of sync).
[10449.269818] uvcvideo: Dropping payload (out of sync).
[10449.269822] uvcvideo: Dropping payload (out of sync).
[10449.270019] uvcvideo: uvc_v4l2_poll
[10449.273371] uvcvideo: Dropping payload (out of sync).
[10449.273378] uvcvideo: Dropping payload (out of sync).
[10449.273382] uvcvideo: Dropping payload (out of sync).
[10449.273390] uvcvideo: Dropping payload (out of sync).
[10449.273396] uvcvideo: Dropping payload (out of sync).
[10449.273556] uvcvideo: Dropping payload (out of sync).
[10449.273565] uvcvideo: Dropping payload (out of sync).
[10449.273572] uvcvideo: Dropping payload (out of sync).
[10449.273734] uvcvideo: Dropping payload (out of sync).
[10449.273739] uvcvideo: Dropping payload (out of sync).
[10449.273744] uvcvideo: Dropping payload (out of sync).
[10449.273751] uvcvideo: Dropping payload (out of sync).
[10449.273756] uvcvideo: Dropping payload (out of sync).
[10449.273761] uvcvideo: Dropping payload (out of sync).
[10449.273766] uvcvideo: Dropping payload (out of sync).
[10449.273770] uvcvideo: Dropping payload (out of sync).
[10449.273775] uvcvideo: Dropping payload (out of sync).
[10449.273780] uvcvideo: Dropping payload (out of sync).
[10449.273786] uvcvideo: Dropping payload (out of sync).
[10449.273794] uvcvideo: Dropping payload (out of sync).
[10449.273798] uvcvideo: Dropping payload (out of sync).
[10449.273804] uvcvideo: Dropping payload (out of sync).
[10449.273809] uvcvideo: Dropping payload (out of sync).
[10449.273814] uvcvideo: Dropping payload (out of sync).
[10449.273819] uvcvideo: Dropping payload (out of sync).
[10449.273823] uvcvideo: Dropping payload (out of sync).
[10449.273830] uvcvideo: Dropping payload (out of sync).
[10449.273993] uvcvideo: Dropping payload (out of sync).
[10449.274004] uvcvideo: Dropping payload (out of sync).
[10449.274016] uvcvideo: frame 205692 stats: 0/169/266 packets, 0/0/266 pts (!early initial), 265/266 scr, last pts/stc/sof 364258471/364766481/1731
[10449.274617] uvcvideo: uvc_v4l2_poll
[10449.301366] uvcvideo: Frame complete (EOF found).
[10449.301378] uvcvideo: Dropping payload (out of sync).
[10449.301385] uvcvideo: Dropping payload (out of sync).
[10449.301515] uvcvideo: Dropping payload (out of sync).
[10449.301524] uvcvideo: Dropping payload (out of sync).
[10449.301529] uvcvideo: Dropping payload (out of sync).
[10449.301536] uvcvideo: Dropping payload (out of sync).
[10449.301669] uvcvideo: Dropping payload (out of sync).
[10449.301681] uvcvideo: Dropping payload (out of sync).
[10449.301686] uvcvideo: Dropping payload (out of sync).
[10449.301691] uvcvideo: Dropping payload (out of sync).
[10449.301695] uvcvideo: Dropping payload (out of sync).
[10449.301700] uvcvideo: Dropping payload (out of sync).
[10449.301738] uvcvideo: uvc_v4l2_poll
[10449.305371] uvcvideo: Dropping payload (out of sync).
[10449.305379] uvcvideo: Dropping payload (out of sync).
[10449.305384] uvcvideo: Dropping payload (out of sync).
[10449.305391] uvcvideo: Dropping payload (out of sync).
[10449.305397] uvcvideo: Dropping payload (out of sync).
[10449.305401] uvcvideo: Dropping payload (out of sync).
[10449.305406] uvcvideo: Dropping payload (out of sync).
[10449.305411] uvcvideo: Dropping payload (out of sync).
[10449.305545] uvcvideo: Dropping payload (out of sync).
[10449.305552] uvcvideo: Dropping payload (out of sync).
[10449.305688] uvcvideo: Dropping payload (out of sync).
[10449.305690] uvcvideo: uvc_v4l2_poll
[10449.305696] uvcvideo: Dropping payload (out of sync).
[10449.305699] uvcvideo: Dropping payload (out of sync).
[10449.305702] uvcvideo: Dropping payload (out of sync).
[10449.305705] uvcvideo: Dropping payload (out of sync).
[10449.305708] uvcvideo: Dropping payload (out of sync).
[10449.305711] uvcvideo: Dropping payload (out of sync).
[10449.305714] uvcvideo: Dropping payload (out of sync).
[10449.305718] uvcvideo: Dropping payload (out of sync).
[10449.305723] uvcvideo: Dropping payload (out of sync).
[10449.305727] uvcvideo: Dropping payload (out of sync).
[10449.305731] uvcvideo: Dropping payload (out of sync).
[10449.305733] uvcvideo: Dropping payload (out of sync).
[10449.305736] uvcvideo: Dropping payload (out of sync).
[10449.305738] uvcvideo: Dropping payload (out of sync).
[10449.305740] uvcvideo: Dropping payload (out of sync).
[10449.305743] uvcvideo: Dropping payload (out of sync).
[10449.305748] uvcvideo: Dropping payload (out of sync).
[10449.305751] uvcvideo: Dropping payload (out of sync).
[10449.305754] uvcvideo: Dropping payload (out of sync).
[10449.305757] uvcvideo: Dropping payload (out of sync).
[10449.305759] uvcvideo: Dropping payload (out of sync).
[10449.309453] uvcvideo: Dropping payload (out of sync).
[10449.309455] uvcvideo: Dropping payload (out of sync).
[10449.309456] uvcvideo: Dropping payload (out of sync).
[10449.309462] uvcvideo: Dropping payload (out of sync).
[10449.309464] uvcvideo: Dropping payload (out of sync).
[10449.309465] uvcvideo: Dropping payload (out of sync).
[10449.309466] uvcvideo: Dropping payload (out of sync).
[10449.309467] uvcvideo: Dropping payload (out of sync).
[10449.309472] uvcvideo: frame 205693 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 364758894/365267099/1764
[10449.333368] uvcvideo: Frame complete (EOF found).
[10449.333380] uvcvideo: Dropping payload (out of sync).
[10449.333528] uvcvideo: uvc_v4l2_poll
[10449.337356] uvcvideo: Dropping payload (out of sync).
[10449.337367] uvcvideo: Dropping payload (out of sync).
[10449.337371] uvcvideo: Dropping payload (out of sync).
[10449.337510] uvcvideo: Dropping payload (out of sync).
[10449.337512] uvcvideo: uvc_v4l2_poll
[10449.337515] uvcvideo: Dropping payload (out of sync).
[10449.337518] uvcvideo: Dropping payload (out of sync).
[10449.337521] uvcvideo: Dropping payload (out of sync).
[10449.337526] uvcvideo: Dropping payload (out of sync).
[10449.337531] uvcvideo: Dropping payload (out of sync).
[10449.337533] uvcvideo: Dropping payload (out of sync).
[10449.337536] uvcvideo: Dropping payload (out of sync).
[10449.337676] uvcvideo: Dropping payload (out of sync).
[10449.337679] uvcvideo: Dropping payload (out of sync).
[10449.337681] uvcvideo: Dropping payload (out of sync).
[10449.337684] uvcvideo: Dropping payload (out of sync).
[10449.337686] uvcvideo: Dropping payload (out of sync).
[10449.337689] uvcvideo: Dropping payload (out of sync).
[10449.337691] uvcvideo: Dropping payload (out of sync).
[10449.337694] uvcvideo: Dropping payload (out of sync).
[10449.337704] uvcvideo: Dropping payload (out of sync).
[10449.337706] uvcvideo: Dropping payload (out of sync).
[10449.337709] uvcvideo: Dropping payload (out of sync).
[10449.337712] uvcvideo: Dropping payload (out of sync).
[10449.337715] uvcvideo: Dropping payload (out of sync).
[10449.337717] uvcvideo: Dropping payload (out of sync).
[10449.337721] uvcvideo: Dropping payload (out of sync).
[10449.337724] uvcvideo: Dropping payload (out of sync).
[10449.337729] uvcvideo: Dropping payload (out of sync).
[10449.337732] uvcvideo: Dropping payload (out of sync).
[10449.337736] uvcvideo: Dropping payload (out of sync).
[10449.337739] uvcvideo: Dropping payload (out of sync).
[10449.337741] uvcvideo: Dropping payload (out of sync).
[10449.341366] uvcvideo: Dropping payload (out of sync).
[10449.341369] uvcvideo: Dropping payload (out of sync).
[10449.341370] uvcvideo: Dropping payload (out of sync).
[10449.341374] uvcvideo: Dropping payload (out of sync).
[10449.341376] uvcvideo: Dropping payload (out of sync).
[10449.341377] uvcvideo: Dropping payload (out of sync).
[10449.341378] uvcvideo: Dropping payload (out of sync).
[10449.341379] uvcvideo: Dropping payload (out of sync).
[10449.341381] uvcvideo: Dropping payload (out of sync).
[10449.341383] uvcvideo: Dropping payload (out of sync).
[10449.341384] uvcvideo: Dropping payload (out of sync).
[10449.341387] uvcvideo: Dropping payload (out of sync).
[10449.341388] uvcvideo: Dropping payload (out of sync).
[10449.341390] uvcvideo: Dropping payload (out of sync).
[10449.341391] uvcvideo: Dropping payload (out of sync).
[10449.341392] uvcvideo: Dropping payload (out of sync).
[10449.341394] uvcvideo: Dropping payload (out of sync).
[10449.341395] uvcvideo: Dropping payload (out of sync).
[10449.341396] uvcvideo: Dropping payload (out of sync).
[10449.341402] uvcvideo: frame 205694 stats: 0/167/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 365259318/365767717/1797
[10449.369359] uvcvideo: Frame complete (EOF found).
[10449.369371] uvcvideo: Dropping payload (out of sync).
[10449.369381] uvcvideo: Dropping payload (out of sync).
[10449.369384] uvcvideo: Dropping payload (out of sync).
[10449.369520] uvcvideo: Dropping payload (out of sync).
[10449.369529] uvcvideo: Dropping payload (out of sync).
[10449.369535] uvcvideo: Dropping payload (out of sync).
[10449.369542] uvcvideo: Dropping payload (out of sync).
[10449.369674] uvcvideo: Dropping payload (out of sync).
[10449.369682] uvcvideo: Dropping payload (out of sync).
[10449.369690] uvcvideo: Dropping payload (out of sync).
[10449.369695] uvcvideo: Dropping payload (out of sync).
[10449.369700] uvcvideo: Dropping payload (out of sync).
[10449.369704] uvcvideo: Dropping payload (out of sync).
[10449.369711] uvcvideo: Dropping payload (out of sync).
[10449.369716] uvcvideo: Dropping payload (out of sync).
[10449.369722] uvcvideo: Dropping payload (out of sync).
[10449.369726] uvcvideo: Dropping payload (out of sync).
[10449.369732] uvcvideo: Dropping payload (out of sync).
[10449.369737] uvcvideo: Dropping payload (out of sync).
[10449.369742] uvcvideo: Dropping payload (out of sync).
[10449.369747] uvcvideo: Dropping payload (out of sync).
[10449.369752] uvcvideo: Dropping payload (out of sync).
[10449.369910] uvcvideo: uvc_v4l2_poll
[10449.373362] uvcvideo: Dropping payload (out of sync).
[10449.373371] uvcvideo: Dropping payload (out of sync).
[10449.373503] uvcvideo: Dropping payload (out of sync).
[10449.373510] uvcvideo: Dropping payload (out of sync).
[10449.373517] uvcvideo: Dropping payload (out of sync).
[10449.373648] uvcvideo: Dropping payload (out of sync).
[10449.373653] uvcvideo: Dropping payload (out of sync).
[10449.373658] uvcvideo: Dropping payload (out of sync).
[10449.373662] uvcvideo: Dropping payload (out of sync).
[10449.373667] uvcvideo: Dropping payload (out of sync).
[10449.373672] uvcvideo: Dropping payload (out of sync).
[10449.373678] uvcvideo: Dropping payload (out of sync).
[10449.373684] uvcvideo: Dropping payload (out of sync).
[10449.373688] uvcvideo: Dropping payload (out of sync).
[10449.373694] uvcvideo: Dropping payload (out of sync).
[10449.373698] uvcvideo: Dropping payload (out of sync).
[10449.373703] uvcvideo: Dropping payload (out of sync).
[10449.373707] uvcvideo: Dropping payload (out of sync).
[10449.373712] uvcvideo: Dropping payload (out of sync).
[10449.373721] uvcvideo: Dropping payload (out of sync).
[10449.373850] uvcvideo: Dropping payload (out of sync).
[10449.373868] uvcvideo: Dropping payload (out of sync).
[10449.373871] uvcvideo: Dropping payload (out of sync).
[10449.373874] uvcvideo: Dropping payload (out of sync).
[10449.373877] uvcvideo: uvc_v4l2_poll
[10449.373880] uvcvideo: Dropping payload (out of sync).
[10449.373882] uvcvideo: Dropping payload (out of sync).
[10449.374013] uvcvideo: Dropping payload (out of sync).
[10449.374023] uvcvideo: Dropping payload (out of sync).
[10449.374026] uvcvideo: Dropping payload (out of sync).
[10449.374029] uvcvideo: Dropping payload (out of sync).
[10449.374036] uvcvideo: frame 205695 stats: 0/166/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 365759741/366268334/1831
[10449.401369] uvcvideo: Frame complete (EOF found).
[10449.401383] uvcvideo: Dropping payload (out of sync).
[10449.401391] uvcvideo: Dropping payload (out of sync).
[10449.401394] uvcvideo: Dropping payload (out of sync).
[10449.401525] uvcvideo: Dropping payload (out of sync).
[10449.401533] uvcvideo: Dropping payload (out of sync).
[10449.401539] uvcvideo: Dropping payload (out of sync).
[10449.401549] uvcvideo: Dropping payload (out of sync).
[10449.401687] uvcvideo: Dropping payload (out of sync).
[10449.401691] uvcvideo: Dropping payload (out of sync).
[10449.401696] uvcvideo: Dropping payload (out of sync).
[10449.401701] uvcvideo: Dropping payload (out of sync).
[10449.401744] uvcvideo: uvc_v4l2_poll
[10449.405371] uvcvideo: Dropping payload (out of sync).
[10449.405507] uvcvideo: Dropping payload (out of sync).
[10449.405511] uvcvideo: Dropping payload (out of sync).
[10449.405650] uvcvideo: Dropping payload (out of sync).
[10449.405655] uvcvideo: Dropping payload (out of sync).
[10449.405657] uvcvideo: Dropping payload (out of sync).
[10449.405660] uvcvideo: Dropping payload (out of sync).
[10449.405663] uvcvideo: Dropping payload (out of sync).
[10449.405666] uvcvideo: Dropping payload (out of sync).
[10449.405669] uvcvideo: Dropping payload (out of sync).
[10449.405672] uvcvideo: Dropping payload (out of sync).
[10449.405678] uvcvideo: Dropping payload (out of sync).
[10449.405681] uvcvideo: Dropping payload (out of sync).
[10449.405684] uvcvideo: Dropping payload (out of sync).
[10449.405687] uvcvideo: Dropping payload (out of sync).
[10449.405689] uvcvideo: Dropping payload (out of sync).
[10449.405692] uvcvideo: Dropping payload (out of sync).
[10449.405695] uvcvideo: Dropping payload (out of sync).
[10449.405698] uvcvideo: Dropping payload (out of sync).
[10449.405701] uvcvideo: uvc_v4l2_poll
[10449.405704] uvcvideo: Dropping payload (out of sync).
[10449.405707] uvcvideo: Dropping payload (out of sync).
[10449.405711] uvcvideo: Dropping payload (out of sync).
[10449.405715] uvcvideo: Dropping payload (out of sync).
[10449.405717] uvcvideo: Dropping payload (out of sync).
[10449.405720] uvcvideo: Dropping payload (out of sync).
[10449.405852] uvcvideo: Dropping payload (out of sync).
[10449.405857] uvcvideo: Dropping payload (out of sync).
[10449.405862] uvcvideo: Dropping payload (out of sync).
[10449.405864] uvcvideo: Dropping payload (out of sync).
[10449.405868] uvcvideo: Dropping payload (out of sync).
[10449.405873] uvcvideo: Dropping payload (out of sync).
[10449.405877] uvcvideo: Dropping payload (out of sync).
[10449.409359] uvcvideo: Dropping payload (out of sync).
[10449.409360] uvcvideo: Dropping payload (out of sync).
[10449.409361] uvcvideo: Dropping payload (out of sync).
[10449.409364] uvcvideo: Dropping payload (out of sync).
[10449.409365] uvcvideo: Dropping payload (out of sync).
[10449.409366] uvcvideo: Dropping payload (out of sync).
[10449.409367] uvcvideo: Dropping payload (out of sync).
[10449.409368] uvcvideo: Dropping payload (out of sync).
[10449.409368] uvcvideo: Dropping payload (out of sync).
[10449.409371] uvcvideo: frame 205696 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 366260164/366768953/1864
[10449.433376] uvcvideo: Frame complete (EOF found).
[10449.433549] uvcvideo: uvc_v4l2_poll
[10449.437358] uvcvideo: Dropping payload (out of sync).
[10449.437370] uvcvideo: Dropping payload (out of sync).
[10449.437376] uvcvideo: Dropping payload (out of sync).
[10449.437539] uvcvideo: Dropping payload (out of sync).
[10449.437549] uvcvideo: Dropping payload (out of sync).
[10449.437556] uvcvideo: Dropping payload (out of sync).
[10449.437561] uvcvideo: Dropping payload (out of sync).
[10449.437721] uvcvideo: Dropping payload (out of sync).
[10449.437725] uvcvideo: Dropping payload (out of sync).
[10449.437730] uvcvideo: Dropping payload (out of sync).
[10449.437735] uvcvideo: Dropping payload (out of sync).
[10449.437742] uvcvideo: Dropping payload (out of sync).
[10449.437747] uvcvideo: Dropping payload (out of sync).
[10449.437752] uvcvideo: Dropping payload (out of sync).
[10449.437756] uvcvideo: Dropping payload (out of sync).
[10449.437760] uvcvideo: Dropping payload (out of sync).
[10449.437765] uvcvideo: Dropping payload (out of sync).
[10449.437770] uvcvideo: Dropping payload (out of sync).
[10449.437774] uvcvideo: Dropping payload (out of sync).
[10449.437781] uvcvideo: Dropping payload (out of sync).
[10449.437798] uvcvideo: Dropping payload (out of sync).
[10449.437803] uvcvideo: Dropping payload (out of sync).
[10449.437808] uvcvideo: Dropping payload (out of sync).
[10449.437813] uvcvideo: Dropping payload (out of sync).
[10449.437818] uvcvideo: Dropping payload (out of sync).
[10449.437822] uvcvideo: Dropping payload (out of sync).
[10449.437829] uvcvideo: Dropping payload (out of sync).
[10449.437837] uvcvideo: Dropping payload (out of sync).
[10449.437842] uvcvideo: Dropping payload (out of sync).
[10449.437849] uvcvideo: Dropping payload (out of sync).
[10449.437852] uvcvideo: Dropping payload (out of sync).
[10449.437857] uvcvideo: Dropping payload (out of sync).
[10449.438214] uvcvideo: uvc_v4l2_poll
[10449.441406] uvcvideo: Dropping payload (out of sync).
[10449.441410] uvcvideo: Dropping payload (out of sync).
[10449.441412] uvcvideo: Dropping payload (out of sync).
[10449.441418] uvcvideo: Dropping payload (out of sync).
[10449.441420] uvcvideo: Dropping payload (out of sync).
[10449.441421] uvcvideo: Dropping payload (out of sync).
[10449.441422] uvcvideo: Dropping payload (out of sync).
[10449.441578] uvcvideo: Dropping payload (out of sync).
[10449.441579] uvcvideo: Dropping payload (out of sync).
[10449.441581] uvcvideo: Dropping payload (out of sync).
[10449.441582] uvcvideo: Dropping payload (out of sync).
[10449.441593] uvcvideo: Dropping payload (out of sync).
[10449.441595] uvcvideo: Dropping payload (out of sync).
[10449.441596] uvcvideo: Dropping payload (out of sync).
[10449.441597] uvcvideo: Dropping payload (out of sync).
[10449.441599] uvcvideo: Dropping payload (out of sync).
[10449.441600] uvcvideo: Dropping payload (out of sync).
[10449.441601] uvcvideo: Dropping payload (out of sync).
[10449.441603] uvcvideo: Dropping payload (out of sync).
[10449.441606] uvcvideo: Dropping payload (out of sync).
[10449.441612] uvcvideo: frame 205697 stats: 0/168/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 366760588/367269572/1898
[10449.469362] uvcvideo: Frame complete (EOF found).
[10449.469381] uvcvideo: Dropping payload (out of sync).
[10449.469385] uvcvideo: Dropping payload (out of sync).
[10449.469541] uvcvideo: Dropping payload (out of sync).
[10449.469550] uvcvideo: Dropping payload (out of sync).
[10449.469556] uvcvideo: Dropping payload (out of sync).
[10449.469563] uvcvideo: Dropping payload (out of sync).
[10449.469722] uvcvideo: Dropping payload (out of sync).
[10449.469727] uvcvideo: Dropping payload (out of sync).
[10449.469734] uvcvideo: Dropping payload (out of sync).
[10449.469740] uvcvideo: Dropping payload (out of sync).
[10449.469744] uvcvideo: Dropping payload (out of sync).
[10449.469750] uvcvideo: Dropping payload (out of sync).
[10449.469756] uvcvideo: Dropping payload (out of sync).
[10449.469762] uvcvideo: Dropping payload (out of sync).
[10449.469767] uvcvideo: Dropping payload (out of sync).
[10449.469772] uvcvideo: Dropping payload (out of sync).
[10449.469781] uvcvideo: Dropping payload (out of sync).
[10449.469787] uvcvideo: Dropping payload (out of sync).
[10449.469791] uvcvideo: Dropping payload (out of sync).
[10449.469796] uvcvideo: Dropping payload (out of sync).
[10449.469801] uvcvideo: Dropping payload (out of sync).
[10449.469987] uvcvideo: uvc_v4l2_poll
[10449.473467] uvcvideo: Dropping payload (out of sync).
[10449.473472] uvcvideo: Dropping payload (out of sync).
[10449.473479] uvcvideo: Dropping payload (out of sync).
[10449.473638] uvcvideo: Dropping payload (out of sync).
[10449.473647] uvcvideo: Dropping payload (out of sync).
[10449.473652] uvcvideo: Dropping payload (out of sync).
[10449.473657] uvcvideo: Dropping payload (out of sync).
[10449.473661] uvcvideo: Dropping payload (out of sync).
[10449.473667] uvcvideo: Dropping payload (out of sync).
[10449.473672] uvcvideo: Dropping payload (out of sync).
[10449.473677] uvcvideo: Dropping payload (out of sync).
[10449.473684] uvcvideo: Dropping payload (out of sync).
[10449.473692] uvcvideo: Dropping payload (out of sync).
[10449.473697] uvcvideo: Dropping payload (out of sync).
[10449.473701] uvcvideo: Dropping payload (out of sync).
[10449.473706] uvcvideo: Dropping payload (out of sync).
[10449.473711] uvcvideo: Dropping payload (out of sync).
[10449.473717] uvcvideo: Dropping payload (out of sync).
[10449.473722] uvcvideo: Dropping payload (out of sync).
[10449.473729] uvcvideo: Dropping payload (out of sync).
[10449.473734] uvcvideo: Dropping payload (out of sync).
[10449.473739] uvcvideo: Dropping payload (out of sync).
[10449.473916] uvcvideo: Dropping payload (out of sync).
[10449.473921] uvcvideo: Dropping payload (out of sync).
[10449.473926] uvcvideo: Dropping payload (out of sync).
[10449.473930] uvcvideo: Dropping payload (out of sync).
[10449.474087] uvcvideo: Dropping payload (out of sync).
[10449.474096] uvcvideo: Dropping payload (out of sync).
[10449.474100] uvcvideo: Dropping payload (out of sync).
[10449.474105] uvcvideo: Dropping payload (out of sync).
[10449.474110] uvcvideo: Dropping payload (out of sync).
[10449.474119] uvcvideo: frame 205698 stats: 0/169/267 packets, 0/0/267 pts (!early initial), 266/267 scr, last pts/stc/sof 367261012/367770190/1931
[10449.474741] uvcvideo: uvc_v4l2_poll

--------------E930507D46929090046225F1
Content-Type: text/x-log; charset=UTF-8;
 name="lsusb.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="lsusb.log"


Bus 001 Device 002: ID 04f2:b604 Chicony Electronics Co., Ltd Integrated Camera (1280x720@30)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x04f2 Chicony Electronics Co., Ltd
  idProduct          0xb604 Integrated Camera (1280x720@30)
  bcdDevice            0.27
  iManufacturer           3 Chicony Electronics Co.,Ltd.
  iProduct                1 Integrated Camera
  iSerial                 2 0001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x03bb
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          4 USB Camera
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               5 Integrated Camera
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              5 Integrated Camera
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x006b
        dwClockFrequency       15.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0 
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x0000000e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            2
        bmControls     0x0000157f
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          Gamma
          White Balance Temperature
          Backlight Compensation
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0 
        bmVideoStandards     0x09
          None
          SECAM - 625/50
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               6
        iTerminal               0 
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {1229a78c-47b4-4094-b0ce-db07386fb938}
        bNumControl             2
        bNrPins                 1
        baSourceID( 0)          2
        bControlSize            2
        bmControls( 0)       0x00
        bmControls( 1)       0x06
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 6
        guidExtensionCode         {26b8105a-0713-4870-979d-da79444bb68e}
        bNumControl             8
        bNrPins                 1
        baSourceID( 0)          4
        bControlSize            4
        bmControls( 0)       0x3c
        bmControls( 1)       0x18
        bmControls( 2)       0x0c
        bmControls( 3)       0x00
        iExtension              6 Realtek Extended Controls Unit
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               6
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      VideoStreaming Interface Descriptor:
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x02b1
        bEndPointAddress                  129
        bmInfo                              0
        bTerminalLink                       3
        bStillCaptureMethod                 2
        bTriggerSupport                     1
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        1
        bNumFrameDescriptors                9
        bFlags                              1
          Fixed-size samples: Yes
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                442368000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           180
        dwMinBitRate                 27648000
        dwMaxBitRate                 27648000
        dwMaxVideoFrameBufferSize      115200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                 36864000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                 48660480
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      202752
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                 48844800
        dwMaxBitRate                 48844800
        dwMaxVideoFrameBufferSize      203520
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                110592000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                147456000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                195379200
        dwMaxBitRate                195379200
        dwMaxVideoFrameBufferSize      814080
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                248832000
        dwMaxBitRate                248832000
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                    0
        bNumImageSizePatterns               9
        wWidth( 0)                       1280
        wHeight( 0)                       720
        wWidth( 1)                        320
        wHeight( 1)                       180
        wWidth( 2)                        320
        wHeight( 2)                       240
        wWidth( 3)                        352
        wHeight( 3)                       288
        wWidth( 4)                        424
        wHeight( 4)                       240
        wWidth( 5)                        640
        wHeight( 5)                       360
        wWidth( 6)                        640
        wHeight( 6)                       480
        wWidth( 7)                        848
        wHeight( 7)                       480
        wWidth( 8)                        960
        wHeight( 8)                       540
        bNumCompressionPatterns             0
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        2
        bNumFrameDescriptors                9
        guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                147456000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           180
        dwMinBitRate                 27648000
        dwMaxBitRate                 27648000
        dwMaxVideoFrameBufferSize      115200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                 36864000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                 48660480
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      202752
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                 48844800
        dwMaxBitRate                 48844800
        dwMaxVideoFrameBufferSize      203520
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                110592000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                147456000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                130252800
        dwMaxBitRate                130252800
        dwMaxVideoFrameBufferSize      814080
        dwDefaultFrameInterval         500000
        bFrameIntervalType                  1
        dwFrameInterval( 0)            500000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                124416000
        dwMaxBitRate                124416000
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  1
        dwFrameInterval( 0)            666666
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                    0
        bNumImageSizePatterns               9
        wWidth( 0)                       1280
        wHeight( 0)                       720
        wWidth( 1)                        320
        wHeight( 1)                       180
        wWidth( 2)                        320
        wHeight( 2)                       240
        wWidth( 3)                        352
        wHeight( 3)                       288
        wWidth( 4)                        424
        wHeight( 4)                       240
        wWidth( 5)                        640
        wHeight( 5)                       360
        wWidth( 6)                        640
        wHeight( 6)                       480
        wWidth( 7)                        848
        wHeight( 7)                       480
        wWidth( 8)                        960
        wHeight( 8)                       540
        bNumCompressionPatterns             0
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0080  1x 128 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0b00  2x 768 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0c00  2x 1024 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1380  3x 896 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       7
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x13fc  3x 1020 bytes
        bInterval               1
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0035
  bNumDeviceCaps          2
  Container ID Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType      4
    bReserved               0
    ContainerID             {20b69f2c-34b3-4690-a228-67bd251277e9}
  Platform Device Capability:
    bLength                28
    bDescriptorType        16
    bDevCapabilityType      5
    bReserved               0
    PlatformCapabilityUUID    {d8dd60df-4589-4cc7-9cd2-659d9e648a9f}
    CapabilityData[0]    0x00
    CapabilityData[1]    0x00
    CapabilityData[2]    0x00
    CapabilityData[3]    0x0a
    CapabilityData[4]    0xe8
    CapabilityData[5]    0x00
    CapabilityData[6]    0x5f
    CapabilityData[7]    0x00
Device Status:     0x0000
  (Bus Powered)

--------------E930507D46929090046225F1--
