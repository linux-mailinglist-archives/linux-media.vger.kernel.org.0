Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9482569F3
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 22:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbgH2UG4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Aug 2020 16:06:56 -0400
Received: from sonic305-37.consmr.mail.bf2.yahoo.com ([74.6.133.236]:35856
        "EHLO sonic305-37.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728380AbgH2UGz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Aug 2020 16:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1598731614; bh=rEaUwHKYndtlTGQd1sVG1k+Ery/k+jQaHg2LkuM/QbA=; h=Date:From:Reply-To:Subject:References:From:Subject; b=jHaYq5FjXzwgeYgoIFJwNPxupkIc/S9H3azqSeclw0GIbrNUFlMVzmQYlzMnqA3Vs/heji/hVM1iL6YAKtQEsNdilXmGyDz1hVSwTFW6N87Uu6GVDxeVppd6Bvt+gkb4z/4EQgen+H5Wx06yilAZXgZrKhxtS1TSf8O6RXUKekecUMXXqACuS83RIveazHWA64YU0AAJiWwULK1yqngTlOVZMO/A0fPb2AUUMttrKeFScYec6jlQQapLoLz16CheauPH/k7pb8SEv30hKeruYc/f5kBpelLt3zbJXnH5sxsFpIcMMcjaysyrw1oSqsHRAPy4RtSuahGYaLIzdESb+Q==
X-YMail-OSG: lmsd1S0VM1nkNL4hLHTZbBnytu64JY32QNVVIIP88YYPLaZLeH2krzoVjFDtrSS
 ytvAWEaylt4NuLW4pFtPgkmfsSfllzaZTzdeTUlRLQNHDwqJzmYJKOZSP1ak9g1QrdKO.aBU2q0B
 l2.M_qCL_r1oRTGLxTDwC1eZxgiuwVSrAJX890hykXtc93QaXjFc1uWHE6RWSWgBOTeTOO.wg7vj
 v2wXsVBO8lZEtQh7jwGQ3kVcatdOe2DPORmAJhrGpHqOGtFFzcNxInZaVVPGn2NysupB_3GAe1ai
 g1BBzswRCIua0u6wfmyWjmLJfTiP6_P256meZnDbJuWDdgqk4yddWgiDY8MT2ZNMeY7t7mKWTkIS
 hQsLSF3wIgQu8lV06WVwkEw42lB44.wuX8ngv6gKhDzNCX.eV8zjfy2hbluslj_O2fRCD3kclTBC
 63bmpxzuPZjRMZ0tbTMXUTW9fkTBTsLTUfD7hIatrvppZhfdfVMeDGLxhrIvglpkxpuFOz_Y2QMb
 yCMYCZ_S05z8RBgAvJnSe5Hd.84yiabeNuCuoCcWfidCRPZ.fw8W6UhwyF3D.mRYeRftZMfCsMP7
 OnRKQk1H0e3e6omNpXEI.11pe81Et7.oXQeAglLv8eDhFHszIuFe4wBnK4R0JffrAphKPCHJgvIb
 g82AHfVgdUkgb4fUGji9dO9BQvR07pchIsnWvyiPaowIuy9H9LIMexLE4UUR0DN9XYlupO8uZ5fv
 izkkAOAQ0bTZsO564FZn3F4BBxcusvJlXYBhKHJ0zfHKhDDYk31b7N8jtzMPDl2IVRqRO1aKbz.m
 M4RH_1dK4kG3iMAVqEGQDr3CWmXZAVoC.UIC_iTqlsdNxA8KfjeW6ozdOb1G7Fqh5iaJwSmsmovz
 eodOvai6MAdJMpcVEsbJtvZrEdUn9q9v9dM9IDd0I2mWNebGX0SbtwbFSegXKjpDrDmFNJkFAC1_
 J0IabAOW5B3wHHfnpyEIm56hMVsE6mus6qBiSwFRNtGshmE.11yUkmMZ3JclYymT6PV4uYqvxaRO
 Q.9NArgtbAH8SyuqMn3qXBlmJq.mlOU.YySmtqOJGMGXHtiLGlYTn1o0hSUGgv_5bdz76lgs95sJ
 e1cdo1ZuZuZgo_GVsTBRWYbeA8fDf137sZYe.hNxqD4xfCSsLOXNxN2hJkeVzaIFkYfTeUS9QKps
 S6AeS3wUM0a8TLzXsqbKWnurA3NcUngl2F_PNHQzux_hjFv.rmXj03mcrNlb2QByjdDz7ilaYRFv
 M7uCtuCijthjbLqywaZq13cfDvQXSJoMvdfRYe3azEazv4h7BaW0Ys6GH8UeG0FOMOSXA_O3l3rT
 KCPRqt4YXM0xDwVFlSLMPtjlCbSlwiTwY03c0GA.c0bYWqoHHtFyM6okovPsCHogadcLjrR.c_4h
 647aLLQUrBvgFdyOD.z6CYsMgW4CcksnwNo4NBbS9MYTdfOCfaPDf5ChqmjmRW0SncBas1L6rSih
 4DUDVP.zgZuFOfzU-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Sat, 29 Aug 2020 20:06:54 +0000
Date:   Sat, 29 Aug 2020 20:04:53 +0000 (UTC)
From:   "Relief Funding." <crff4@vcdsz.net.in>
Reply-To: rosesmith@live.co.uk
Message-ID: <10159377.187777.1598731493212@mail.yahoo.com>
Subject: Relief Funding.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <10159377.187777.1598731493212.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16565 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Dear: Beneficiary,

An irrevocable payment guarantee of =C2=A3250,000,00 GBP has been issued by=
 the UN/ World Bank Group and the International Monetary Fund (IMF) on Covi=
d- 19 relief .

Kindly forward the below details correctly to enable us proceed on your fil=
e as instructed by IMF AND UN Monetary Unit.

1. Your Full Name:
2. Address Where You Want the Courier Company to Send Your ATM Card
To or (P.O Box) :
3. Your Age:
4. Occupation:
5. Telephone Numbers:
6. Country:

Regards.

Mr. Harry Burns.
Director ATM Payment Department
(Barclays Bank Of London Plc)
