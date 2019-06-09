Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 737163AE9A
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 07:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387484AbfFJF2I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 01:28:08 -0400
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:11716 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387430AbfFJF2I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 01:28:08 -0400
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1560143441; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Reply-To:
         Message-Id:X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-SAAS-TrackingID:X-NAI-Spam-Flag:X-NAI-Spam-Threshold:
         X-NAI-Spam-Score:X-NAI-Spam-Rules:X-NAI-Spam-Version;
        bh=U0Muiz5ECa3gaTzMJe13Eshf2iywdDpIp+lqwE
        FBq5U=; b=Ot14bGpdOPXPlORZgdwT/7VKRItTApu8o4IJFay3
        jMd/POOA1djLWjw67XkCRbqVD0egovCegOe4RGYrWuiwmndttj
        nXKvp/SZ76jypcgp6v33oOVA39PHtn0KoiHEYnQ3iGw8usEkGl
        TLAkojFwSEwZi7JlmFSvtbxDU/iMpI0=
Received: from cdmx.gob.mx (unknown [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 717f_0198_02b42220_d5a0_4964_9212_c98d89b9585b;
        Mon, 10 Jun 2019 00:10:41 -0500
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 6EA8E2C75C6;
        Sun,  9 Jun 2019 23:22:31 -0500 (CDT)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id aewPR_yA8zSr; Sun,  9 Jun 2019 23:22:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 0BF28346910;
        Sun,  9 Jun 2019 14:13:32 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx 0BF28346910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1560107613;
        bh=U0Muiz5ECa3gaTzMJe13Eshf2iywdDpIp+lqwEFBq5U=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Reply-To:Message-Id;
        b=qqFxM0mwS/OWS9k73HBZwSF1LC2bqG3neMwlCDP3cMjFr7RWUZDsx2eXmeHsQK4ka
         N6NQkRA4jDTqwoEOW9PdVJlx9SUlkuURN8OMwMLCsdUwG43Jwup8e+JJU+soT4nWKP
         5xd24TE7FgmMWnNa9ZAB3DB1PiRXOjbMMf8G+710=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id wBx1YGMXOnPG; Sun,  9 Jun 2019 14:13:31 -0500 (CDT)
Received: from DESKTOP-C54UF22.mshome.net (unknown [105.12.6.249])
        by cdmx.gob.mx (Postfix) with ESMTPSA id 5EC881F9EFD;
        Sun,  9 Jun 2019 11:18:29 -0500 (CDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?UmU6IOKCrCAyLDAwMCwwMDAuMDAgRXVybw==?=
To:     Recipients <dgcomisacconocimiento@cdmx.gob.mx>
From:   dgcomisacconocimiento@cdmx.gob.mx
Date:   Sun, 09 Jun 2019 09:18:13 -0700
Reply-To: dannywattlove@gmail.com
Message-Id: <20190609161829.5EC881F9EFD@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=Xfr59Mx5 c=1 sm=1 tr=0 p=nCBbLvlypp4A:10 p=UhPmRW]
X-AnalysisOut: [QW4yN_uUvCwugA:9 p=Ner0o0mvyuUA:10 p=3pMtnZpqCKiyClwKCSdm:]
X-AnalysisOut: [22 p=Z3hVr4-9LPz_iBwj1Snb:22 a=T6zFoIZ12MK39YzkfxrL7A==:11]
X-AnalysisOut: [7 a=jGBuzw2MYhlZK3s3jCHfAw==:17 a=IkcTkHD0fZMA:10 a=x7bEGL]
X-AnalysisOut: [p0ZPQA:10 a=dq6fvYVFJ5YA:10 a=pGLkceISAAAA:8 a=QEXdDO2ut3Y]
X-AnalysisOut: [A:10 a=uXetiwfYVjQA:10]
X-SAAS-TrackingID: e66edfc5.0.214309229.00-2259.364880811.s12p02m013.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6564> : inlines <7098> : streams
 <1824051> : uri <2854479>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ich bin Herr Richard Wahl der Mega-Gewinner von $ 533M In Mega Millions Jac=
kpot spende ich an 5 zuf=C3=A4llige Personen, wenn Sie diese E-Mail erhalte=
n, dann wurde Ihre E-Mail nach einem Spinball ausgew=C3=A4hlt. Ich habe den=
 gr=C3=B6=C3=9Ften Teil meines Verm=C3=B6gens auf eine Reihe von Wohlt=C3=
=A4tigkeitsorganisationen und Organisationen verteilt. Ich habe mich freiwi=
llig dazu entschieden, Ihnen den Betrag von =E2=82=AC 2.000.000,00 zu spend=
en eine der ausgew=C3=A4hlten 5, um meine Gewinne zu =C3=BCberpr=C3=BCfen. =
Das ist dein Spendencode: [DF00430342018] Antworten Sie mit dem Spendencode=
 auf diese E-Mail: richardpovertyorg@gmail.com
