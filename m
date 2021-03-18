Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4584934037D
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 11:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhCRKiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 06:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhCRKh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 06:37:56 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D14C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 03:37:56 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4F1NlM4WwSzQjmm;
        Thu, 18 Mar 2021 11:37:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schenkel.net;
        s=MBO0001; t=1616063869;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SC0VUWawE0QXkRJ8ETtgJpw1+KTul2WdUvciEskdx6k=;
        b=OEGnAWsLpi7jnlmJQnAoGb3FU6Vhv33CG3EfJZq/ANSZqUs/XRPwKyghD6XjE1uREi9zMx
        9hoyysx4tgAHnlZSJF6+PBRYigsXSpgN7OTZiLcJCBOVp+3e1Rn5JzYY0lYDfqYAQuQ0mG
        v16Us5nrg+A8ukcl8djVtpDmfo1/TYkgKjYwj/bZnRA++W6m4TNC3vJp2Dd8VO3LR2/ie4
        H1c5ElRD8n9yp3+1yZulerq0+xnTnolfvBNgscIDbERANl0YLL05dKlmprdB3zNtXkVo0l
        1QiyY8zZOhRyhClPlS8v74LKmLxxHCh1ptEPwSl6ukncHFltjKAqBFePJ7cllA==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id LVjhMSeYEDNG; Thu, 18 Mar 2021 11:37:45 +0100 (CET)
Subject: Re: [PATCH] Add extra keys for rc6-mce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schenkel.net;
        s=mail; t=1616063863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SC0VUWawE0QXkRJ8ETtgJpw1+KTul2WdUvciEskdx6k=;
        b=QWlhii9H8F5sbKHwXVmzOfVtOYmx8o8hvuMurXf5r3Vx1+f9ozXJD0hFSxRdF+eIkzNUn8
        q5fwr4hig8M3P6/phDpmibmTHwukdaQpj47KDfawt/4EWxImtLLFvcL04nGgBj65fuhjq2
        HKi/UCc7xNRHXAC9JJejVwUCb/2LnYcuepkE+elEIh7SPZX94L+KJs8OFc8eAL9+VLYHYM
        cXUgs3uY1wWjYlVdp4u3L1DxVsyXVCIBqlKLu/pD2EmuqG908mpDlJBt2kI7bu/o8kOCKU
        lMr8numY6NK+5+YOiCK6Da9Ii/JPWxm1Rqh+UoPxb1XlvHK9txEFgjUPMDym1w==
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
References: <288ddcee-15d1-90b7-8d52-4519faa56ea4@schenkel.net>
 <20210318094331.GA31494@gofer.mess.org>
From:   Leonardo Brondani Schenkel <leonardo@schenkel.net>
Message-ID: <02f81d1f-259d-97e9-edff-0e898bbb1b2e@schenkel.net>
Date:   Thu, 18 Mar 2021 11:37:43 +0100
MIME-Version: 1.0
In-Reply-To: <20210318094331.GA31494@gofer.mess.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms030308030306040308050201"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -6.00 / 15.00 / 15.00
X-Rspamd-Queue-Id: 4D5D517F6
X-Rspamd-UID: e6d5fb
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms030308030306040308050201
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 18/03/2021 10.43, Sean Young wrote:
>> I added comments in the diff after the fact to communicate to this lis=
t what
>> the buttons are on the remote, so you can know why the specific key wa=
s
>> chosen.
>=20
> I can't see those comments.

I wasn't very clear. I meant the "#"s, like "# Open/Close".

> Thank you for your patch. These files are generated from the linux kern=
el
> tree. Your patch should modifiy drivers/media/rc/keymaps/rc-rc6-mce.c,
> and then utils/keytable/rc_keymaps/rc6_mce.toml will be regenerated fro=
m
> it.

I noticed the comment on the top of the file. I suspected that I had to=20
submit a patch to the kernel instead, but I decided to submit to this=20
list first to get that confirmed.

> Many thanks

Thank you.
// Leonardo.


--------------ms030308030306040308050201
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
LnAuQS4xLDAqBgNVBAMMI0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEczMIIC
IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA7eaHlqHBpLbtwkJV9z8PDyJgXxPgpkOI
hkmReRwbLxpQD9xGAe72ujqGzFFh78QPgAhxKVqtGHzYeq0VJVCzhnCKRBbVX+JwIhL3ULYh
UAZrViUp952qDB6qTL5sGeJS9F69VPSR5k6pFNw7mHDTTt0voWFg2aVkG3khomzVXoieJGOi
Q4dH76paCtQbLkt59joAKz2BnwGLQ4wr09nfumJt5AKx2YxHK2XgSPslVZ4z8G00gimsfA7U
tjT/wiekY6Z0b7ksLrEcvODncHQe9VSrNRA149SE3AlkWaZM/joVei/GYfj9K5jkiReinR4m
qM353FEceLOeBhSTURpMdQ5wsXLi9DSTGBuNv4aw2Dozb/qBlkhGTvwk92mi0jAecE22Sn3A
9UfrU2p1w/uRs+TIteQ0xO0B/J2mY2caqocsS9SsriIGlQ8b0LT0o6Ob07KGtPa5/lIvMmx5
72Dv2v+vDiECByxm1Hdgjp8JtE4mdyYP6GBscJyT71NZw1zXHnFkyCbxReag9qaSR9x4CVVX
j1BDmNROCqd5NAfIXUXYTFeZ/jukQigkxXGWhEhfLBC4Ha6pwizz9fq1+wwPKcWaF9P/SZOu
BDrG30MiyCZa66G9mEtF5ZLuh4rGfKqxy4Z5Mxecuzt+MZmrSKfKGeXOeED/iuX5Z02M1o7i
MS8CAwEAAaOCAfQwggHwMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAUUtiIOsifeGbt
ifN7OHCUyQICNtAwQQYIKwYBBQUHAQEENTAzMDEGCCsGAQUFBzABhiVodHRwOi8vb2NzcDA1
LmFjdGFsaXMuaXQvVkEvQVVUSC1ST09UMEUGA1UdIAQ+MDwwOgYEVR0gADAyMDAGCCsGAQUF
BwIBFiRodHRwczovL3d3dy5hY3RhbGlzLml0L2FyZWEtZG93bmxvYWQwHQYDVR0lBBYwFAYI
KwYBBQUHAwIGCCsGAQUFBwMEMIHjBgNVHR8EgdswgdgwgZaggZOggZCGgY1sZGFwOi8vbGRh
cDA1LmFjdGFsaXMuaXQvY24lM2RBY3RhbGlzJTIwQXV0aGVudGljYXRpb24lMjBSb290JTIw
Q0EsbyUzZEFjdGFsaXMlMjBTLnAuQS4lMmYwMzM1ODUyMDk2NyxjJTNkSVQ/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdDtiaW5hcnkwPaA7oDmGN2h0dHA6Ly9jcmwwNS5hY3RhbGlzLml0
L1JlcG9zaXRvcnkvQVVUSC1ST09UL2dldExhc3RDUkwwHQYDVR0OBBYEFL6XqaqEv4C/EFN9
CTL54S4yG893MA4GA1UdDwEB/wQEAwIBBjANBgkqhkiG9w0BAQsFAAOCAgEAJpvnG1kNdLMS
A+nnVfeEgIXNQsM7YRxXx6bmEt9IIrFlH1qYKeNw4NV8xtop91Rle168wghmYeCTP10FqfuK
MZsleNkI8/b3PBkZLIKOl9p2Dmz2Gc0I3WvcMbAgd/IuBtx998PJX/bBb5dMZuGV2drNmxfz
3ar6ytGYLxedfjKCD55Yv8CQcN6e9sW5OUm9TJ3kjt7Wdvd1hcw5s+7bhlND38rWFJBuzump
5xqm1NSOggOkFSlKnhSz6HUjgwBaid6Ypig9L1/TLrkmtEIpx+wpIj7WTA9JqcMMyLJ0rN6j
jpetLSGUDk3NCOpQntSy4a8+0O+SepzS/Tec1cGdSN6Ni2/A7ewQNd1Rbmb2SM2qVBlfN0e6
ZklWo9QYpNZyf0d/d3upsKabE9eNCg1S4eDnp8sJqdlaQQ7hI/UYCAgDtLIm7/J9+/S2zuwE
WtJMPcvaYIBczdjwF9uW+8NJ/Zu/JKb98971uua7OsJexPFRBzX7/PnJ2/NXcTdwudShJc/p
d9c3IRU7qw+RxRKchIczv3zEuQJMHkSSM8KM8TbOzi/0v0lU6SSyS9bpGdZZxx19Hd8Qs0cv
+R6nyt7ohttizwefkYzQ6GzwIwM9gSjH5Bf/r9Kc5/JqqpKKUGicxAGy2zKYEGB0Qo761Mcc
IyclBW9mfuNFDbTBeDEyu80xggPzMIID7wIBATCBljCBgTELMAkGA1UEBhMCSVQxEDAOBgNV
BAgMB0JlcmdhbW8xGTAXBgNVBAcMEFBvbnRlIFNhbiBQaWV0cm8xFzAVBgNVBAoMDkFjdGFs
aXMgUy5wLkEuMSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBH
MwIQbTEHAL1+rU7GJdUMarw5eDANBglghkgBZQMEAgEFAKCCAi0wGAYJKoZIhvcNAQkDMQsG
CSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEwMzE4MTAzNzQzWjAvBgkqhkiG9w0BCQQx
IgQgsUcxCXpkSgKY95C3J0Z9KH+xF7PsIn7WHECE5CMTPn0wbAYJKoZIhvcNAQkPMV8wXTAL
BglghkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDAN
BggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDCBpwYJKwYBBAGCNxAEMYGZ
MIGWMIGBMQswCQYDVQQGEwJJVDEQMA4GA1UECAwHQmVyZ2FtbzEZMBcGA1UEBwwQUG9udGUg
U2FuIFBpZXRybzEXMBUGA1UECgwOQWN0YWxpcyBTLnAuQS4xLDAqBgNVBAMMI0FjdGFsaXMg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEczAhBtMQcAvX6tTsYl1QxqvDl4MIGpBgsqhkiG
9w0BCRACCzGBmaCBljCBgTELMAkGA1UEBhMCSVQxEDAOBgNVBAgMB0JlcmdhbW8xGTAXBgNV
BAcMEFBvbnRlIFNhbiBQaWV0cm8xFzAVBgNVBAoMDkFjdGFsaXMgUy5wLkEuMSwwKgYDVQQD
DCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBHMwIQbTEHAL1+rU7GJdUMarw5
eDANBgkqhkiG9w0BAQEFAASCAQAPew/j5T1IozUC/jZBNFnxEVNKEQD/k9aM83lnZ9yS6apk
PxTcoRLMm/U9IRqip46UyafrH/gUGepxcx2Da22aOwbGS9i5pHKM24D20f/GDu4QXdVxLXys
sKN5Enk7/pnpEBTFTmgzDXrAYeKe0MM0yBWBuwnTn6mC6t4uK1DYuIAbHG30jTZraHXbf8Ym
uMGwNU1hwmDl2wWKyfEMDgFBH9VWu8hrLj+FoocUYXyhBudog+zSNqPkTduhnsPRikJqigoj
L+T8baK14riaJwax5DVYa0/WXn5k5Wc577RVMxeyt2sER38ZbvOg0T42093afXqeYC0tiUws
VD7JoB6sAAAAAAAA
--------------ms030308030306040308050201--
