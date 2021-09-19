Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65429410CBF
	for <lists+linux-media@lfdr.de>; Sun, 19 Sep 2021 19:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhISR6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Sep 2021 13:58:12 -0400
Received: from imsva.erbakan.edu.tr ([95.183.198.89]:45766 "EHLO
        imsva.erbakan.edu.tr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhISR6M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Sep 2021 13:58:12 -0400
X-Greylist: delayed 1190 seconds by postgrey-1.27 at vger.kernel.org; Sun, 19 Sep 2021 13:58:11 EDT
Received: from imsva.erbakan.edu.tr (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B281812490F;
        Sun, 19 Sep 2021 20:28:57 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=erbakan.edu.tr;
        s=dkim; t=1632072537;
        bh=GF0kCZVzMAbL+zC2eGZ6bprg0BK693Z+UfWbMwtUgEs=; h=Date:From:To;
        b=n4hjaV27ttunJIa21KLGUtONCDRq8waqC/C0N3+iJGjlRHjR0Xg4V0nsUrxiauzIQ
         MXV+gEIJEiyBRV0EaVYaSfBX7wVDC8twvZSsK9g7TOH4nndxS0ywJ/jHS0nDqBg8lv
         F7dJLaWN5lOtSgiP4cc0RFd84iDu9j7+8dCkhoCw=
Received: from imsva.erbakan.edu.tr (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9D9D612490D;
        Sun, 19 Sep 2021 20:28:57 +0300 (+03)
Received: from eposta.erbakan.edu.tr (unknown [172.42.40.30])
        by imsva.erbakan.edu.tr (Postfix) with ESMTPS;
        Sun, 19 Sep 2021 20:28:57 +0300 (+03)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by eposta.erbakan.edu.tr (Postfix) with ESMTP id 47D851217BB7E;
        Sun, 19 Sep 2021 20:36:42 +0300 (+03)
Received: from eposta.erbakan.edu.tr ([127.0.0.1])
        by localhost (eposta.erbakan.edu.tr [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id wtp9dEPy57R1; Sun, 19 Sep 2021 20:36:40 +0300 (+03)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by eposta.erbakan.edu.tr (Postfix) with ESMTP id 58A731217BB6F;
        Sun, 19 Sep 2021 20:36:33 +0300 (+03)
DKIM-Filter: OpenDKIM Filter v2.10.3 eposta.erbakan.edu.tr 58A731217BB6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erbakan.edu.tr;
        s=9A114B22-0D17-11E9-AE7D-5CB170D0BDE7; t=1632072997;
        bh=UE+6Rh6p+D/Q/qnCC1rilRTfAwcozVy4J0wYoa1QJws=;
        h=Date:From:Message-ID:MIME-Version;
        b=EyA6BzG7IGR5gku5c2zM/5BjceotVOM3v6MC+Is94B78ce+gjSJAs7z4YPXONrWRS
         YRRCsAy5S7FlVrS258gWjGBzGjm2bAqbwvpK4KxUGtOGm7uApt8lxFxbdqWZu76ELQ
         r66TvFN/LPp92itOqf1Zf6xuZk+0LwPG1y1OlhxCYpONVlEZYTUNhGC/VN54SCQ+Z/
         OLb2RMDhbjUJndcqEAj5XDnw0ACk+EvV8JBgorpx7RwZsNKvgqZZ/b1wqEwHeIZ6QX
         hjrKwfks75RYic2Sav+Iuu+F8h4BN8t2ZScq7MmFtGmb5YJ9+tYMzgGS69fvpjcMb2
         o57SXfB/k9WGQ==
X-Virus-Scanned: amavisd-new at eposta.erbakan.edu.tr
Received: from eposta.erbakan.edu.tr ([127.0.0.1])
        by localhost (eposta.erbakan.edu.tr [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id oBaPQgyvZCZ0; Sun, 19 Sep 2021 20:36:28 +0300 (+03)
Received: from eposta.erbakan.edu.tr (eposta.konya.edu.tr [172.42.44.72])
        by eposta.erbakan.edu.tr (Postfix) with ESMTP id 7EB281217BB06;
        Sun, 19 Sep 2021 20:36:25 +0300 (+03)
Date:   Sun, 19 Sep 2021 20:36:23 +0300 (EET)
From:   =?utf-8?B?eWFyxLHFn21h?= gsf <yarismagsf@erbakan.edu.tr>
Reply-To: =?utf-8?B?eWFyxLHFn21h?= gsf <oasisportfb@gmail.com>
Message-ID: <390000657.524466.1632072983607.JavaMail.zimbra@erbakan.edu.tr>
Subject: Re: Quick loan
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.11_GA_3799 (ZimbraWebClient - GC92 (Win)/8.8.11_GA_3787)
Thread-Index: 8gws71bxw7x/cE3wMq8fURTAwh/Mig==
Thread-Topic: Quick loan
To:     undisclosed-recipients:;
X-TM-AS-GCONF: 00
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oasis is offering quick loans, without credit check to old and new customers. We give Short or long term loan with a relatively low interest rate of about 0.2% on Instant approval.
Oasis Fintech a onetime solution to all your financial need.
Contact us today via email, oasisportfb@gmail.com,  and complete the loan form below....
Your Full Name:
Amount Required:
Contact Phone #:
Occupation:
Loan Duration:
Purpose:
Location:
 
Ms. Bauer
Contact us via: email:  oasisportfb@gmail.com
