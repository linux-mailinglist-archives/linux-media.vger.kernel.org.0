Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA0017AA77
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 17:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgCEQZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 11:25:29 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:55643 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgCEQZ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Mar 2020 11:25:29 -0500
Received: by mail-wm1-f44.google.com with SMTP id 6so7048027wmi.5
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2020 08:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version;
        bh=HjFqSG/KNJoIHu6OwV95yQmDSVcZui6tdhzzMLGT8hY=;
        b=vRCphLCNqmdfMOCE8BkFoeA3LisPozdLepX3rP7g+371Ez3t6Ak+5PXq7I3YeaH9w1
         EEnf+NIkWg/QCMBmgmnlq1LKAl78GSOnSL/f/Y3VHz5bxgBkzDKRZvDnQxU/wCspsIV5
         q+vSaXaOUGao+3hjIsbdpw7+cUNZ1kmqeyN9JVJ4emDYs1phibWNWSgrbGfoIUEER0m7
         KYAIAUF+xTkraDfL4r3Kx/ct63RLy94pi9O9FRGICqa9ilrOxe06O4QPy7vKnRx420/l
         F0nDkZP2fJeiBqnpJecPM160UovBQdhBD92s+5eEMlEWiUYRXlZAN+s+beDofBTrgmQX
         w4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:thread-topic:thread-index:date
         :message-id:accept-language:content-language:mime-version;
        bh=HjFqSG/KNJoIHu6OwV95yQmDSVcZui6tdhzzMLGT8hY=;
        b=LYS7+wQHNfRuAJpZiSmb1arCBFPwmkhB/MDLcsoPsjg6N2M8WaUsZh1gw+f+X9wAKo
         hzXKErJrpHNhswaEVZ6+HiwXU6znxzGoUp7kvLz7TsCMO81kLeHojzUU5MLCbHdkBqtN
         1ZAWA1FHCPJoyLRMBNPjfQtyf8Ynm1gfzHBWY4NmHgxY39O7RmK/Y5aQWGBCAE3lKHQa
         EtWLBj0PaxMwOScVZ4JGkXfO9kCqovIX5U5XrOWo2UOtZELi1lemnfYZJCIFt/nPq+zI
         lkS5pT0VjB8KUjKua1ahMDW4caVX+LhBg4R99rA4rwr7mg1PPwexF0oTiXAjrAVl3Cxm
         6ibQ==
X-Gm-Message-State: ANhLgQ2HAtzUsTBFfGPdu75krN3dUkqEV5BrBBxsNS0N6+RNiDjTtzK1
        4zGJlpScSDxXvWjEYo5SAx3ThuF4
X-Google-Smtp-Source: ADFU+vsNcLbeHYP5bIvHm1BrLNwFPaC76xDy1ou8GW/dgZwCmpfSDC4PX5AfFAG70b6W6mxVboMOFw==
X-Received: by 2002:a05:600c:104d:: with SMTP id 13mr10256921wmx.50.1583425525701;
        Thu, 05 Mar 2020 08:25:25 -0800 (PST)
Received: from CWLP265MB1873.GBRP265.PROD.OUTLOOK.COM ([2603:1026:c08:29::5])
        by smtp.gmail.com with ESMTPSA id s7sm6713144wrm.13.2020.03.05.08.25.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 08:25:25 -0800 (PST)
From:   Harry Mallon <hjmallon@gmail.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: edid-decode: Add FreeSync block
Thread-Topic: edid-decode: Add FreeSync block
Thread-Index: AQHV8wqsqm2CdoLQy0yc1XlUoXjHzg==
X-MS-Exchange-MessageSentRepresentingType: 1
Date:   Thu, 5 Mar 2020 16:25:24 +0000
Message-ID: <CWLP265MB187340F11A2D130AB0AD3AE4F2E20@CWLP265MB1873.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: multipart/mixed;
        boundary="_002_CWLP265MB187340F11A2D130AB0AD3AE4F2E20CWLP265MB1873GBRP_"
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--_002_CWLP265MB187340F11A2D130AB0AD3AE4F2E20CWLP265MB1873GBRP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I attach a patch which decodes the simple AMD Freesync structure which is p=
resent in some of the examples in edid-decode.

Best,
Harry

--_002_CWLP265MB187340F11A2D130AB0AD3AE4F2E20CWLP265MB1873GBRP_
Content-Type: application/octet-stream;
	name="0001-edid-decode-Add-FreeSync-block.patch"
Content-Description: 0001-edid-decode-Add-FreeSync-block.patch
Content-Disposition: attachment;
	filename="0001-edid-decode-Add-FreeSync-block.patch"; size=1539;
	creation-date="Thu, 05 Mar 2020 16:25:24 GMT";
	modification-date="Thu, 05 Mar 2020 16:25:24 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwZjgzZDM1YWZkODhmYjNkZDU1ZjMzYWI0NDZhZTE1Mjc3M2NlOWE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYXJyeSBNYWxsb24gPGhqbWFsbG9uQGdtYWlsLmNvbT4KRGF0
ZTogVGh1LCA1IE1hciAyMDIwIDE2OjE4OjU4ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gZWRpZC1k
ZWNvZGU6IEFkZCBGcmVlU3luYyBibG9jawoKLS0tCiBwYXJzZS1jdGEtYmxvY2suY3BwIHwgMTcg
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvcGFyc2UtY3RhLWJsb2NrLmNwcCBiL3BhcnNlLWN0YS1ibG9jay5jcHAKaW5kZXgg
YjA1OWQyYi4uNWI5M2UzYyAxMDA2NDQKLS0tIGEvcGFyc2UtY3RhLWJsb2NrLmNwcAorKysgYi9w
YXJzZS1jdGEtYmxvY2suY3BwCkBAIC0xNjA3LDYgKzE2MDcsMTggQEAgc3RhdGljIHZvaWQgY3Rh
X2hkbWlfYXVkaW9fYmxvY2soY29uc3QgdW5zaWduZWQgY2hhciAqeCwgdW5zaWduZWQgbGVuZ3Ro
KQogCX0KIH0KIAorc3RhdGljIHZvaWQgY3RhX2ZyZWVzeW5jX3JhbmdlX2Jsb2NrKGNvbnN0IHVu
c2lnbmVkIGNoYXIgKngsIHVuc2lnbmVkIGxlbmd0aCkKK3sKKwlpZiAobGVuZ3RoIDwgOCkgewor
CQlmYWlsKCJJbnZhbGlkIGxlbmd0aCAldS5cbiIsIGxlbmd0aCk7CisJCXJldHVybjsKKwl9CisK
KwlwcmludGYoIiAgIEZyZWVTeW5jIHZlcnNpb246ICVkLiVkXG4iLCB4WzNdLCB4WzRdKTsKKwlw
cmludGYoIiAgIEZyZWVTeW5jIG1pblZSYXRlOiAlZFxuIiwgeFs1XSk7CisJcHJpbnRmKCIgICBG
cmVlU3luYyBtYXhWUmF0ZTogJWRcbiIsIHhbNl0pOworfQorCiB2b2lkIGVkaWRfc3RhdGU6OmN0
YV9leHRfYmxvY2soY29uc3QgdW5zaWduZWQgY2hhciAqeCwgdW5zaWduZWQgbGVuZ3RoKQogewog
CWNvbnN0IGNoYXIgKm5hbWU7CkBAIC0xNzcyLDYgKzE3ODQsMTEgQEAgdm9pZCBlZGlkX3N0YXRl
OjpjdGFfYmxvY2soY29uc3QgdW5zaWduZWQgY2hhciAqeCkKIAkJCWhhdmVfaGZfdnNkYiA9IDE7
CiAJCQlicmVhazsKIAkJfQorCQlpZiAob3VpID09IDB4MDAwMDFhKQorCQl7CisJCQljdGFfZnJl
ZXN5bmNfcmFuZ2VfYmxvY2soeCArIDEsIGxlbmd0aCk7CisJCQlicmVhazsKKwkJfQogCQloZXhf
YmxvY2soIiAgICAiLCB4ICsgNCwgbGVuZ3RoIC0gMyk7CiAJCWJyZWFrOwogCWNhc2UgMHgwNDoK
LS0gCjIuMjUuMAoK

--_002_CWLP265MB187340F11A2D130AB0AD3AE4F2E20CWLP265MB1873GBRP_--
