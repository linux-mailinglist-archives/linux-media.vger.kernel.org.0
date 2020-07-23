Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41AB22B6F3
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 21:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgGWTvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 15:51:32 -0400
Received: from mout.web.de ([212.227.17.11]:56247 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgGWTvb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 15:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1595533884;
        bh=Odmaz5LPtqZcSGKF+ghlkQLO/9kq1QnxCZFwxNtnKI8=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=qE+RQnhOkvELQOVwt0R87oO63k2I5HVFNcVCJqG91B2d/FTgBPSxzBvA1vh89MjNH
         ltPdi6a/GDUuDXFiKnygHfilc9hKpSQC59AbYIqoQ9EmRY+l9fxbVKNmZIiWcxkXY7
         5VycOcaH5NNA0hfZU1m5KS+QiN2wm5hWP/C+zI3c=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.132.31]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N8Epu-1ktfbg2g9g-014GgF; Thu, 23
 Jul 2020 21:51:24 +0200
To:     Evgeny Novikov <novikov@ispras.ru>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        ldv-project@linuxtesting.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>
Subject: Re: [PATCH] media: camss: fix memory leaks on error handling paths in
 probe
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <64581990-1f68-131d-2e38-8d3e0b9cbd2a@web.de>
Date:   Thu, 23 Jul 2020 21:51:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hUlzQCYTBYfEQU0QtWYdRVH6T8LJqYd3+6Q71w8fvzUXQPVNnEv
 nSmt93T/1F4vnnCxBY6dcxwJ97VVyA1nNCV9b9fhNwwV6LMQSnz8myrKXvRN/jBHgyie75V
 KvckrM5iVO/rj+UCwwxzUWZ9Pgobcjye9vbveleZBSr04b+KbejGwykLMVgqIBFjzOg7CEO
 Onf2KXEBZBLT2bwMRPsyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iY6RXnc8I94=:8xLd/atHwhbPzSEsSTRBKJ
 u8iwPgRPJgB3bPZzEVMOKo3LqxFd6kk87Unj/VGg6wOZ3M6eI6cjg9oxTZffznNdFMnF7JEH1
 xZl/YpSDUt9vdbrId7GelmFOUHQ53j7bp60OiuKn+jqooRF8ICuTWStpnFv5Tsuc9dX2MsKYu
 sg2/FBmKYstuQtca+KI3krl9/4ADwpxvGmBlZO1ywwQdPCF2QWjHYlyPxr83Ik6tACSMxkHi2
 j7xiGmm0POxQ0sWuzx7AxgFms8Gea0cP8UyPJfaQVBhx2rOphmxy2tIUD6iHF+MfOJVVm3A7R
 zAKmbaWzd5+BjOEy10hTyJqIAEI5V5zNNuhwHMwCFhppstyDkew5BTLp1rKFv+eYSBoLhdsOp
 BKKT7PGphCMF/PyMhv8N1+5mNLsoPtu1yQKbV4WqHCG4+xQMJMHdNzU712RHilfQE2qcYhtKi
 zIcfUjeyMmYaxZsAmHJHVmf/ljqIHZ9h0X4ZpIea7GNATWtaqnjAVU6GeaCJsEOIiLUd8WPJN
 6s7Smf0rgX+vk1HAcBPjNLsajlDuAz2iAJnp0cZZYEEuS38dWp33c8HlBRYOjT5Q0agBprIpm
 9gcr+cA5chq3SVakrLVXHsk7eaLj1LqhzsblhZo+6h5NTlZwMbJqBOjFuDOWGwk1YyblCmSTd
 psIcTYq9xTLBwP2IBcPoZKj+7E4vQEZiGP9QFPfeJjip9z0grv+fO2m3s7zFWnR6gKxIgM77U
 Pt3FkpTVEuXd5YGLJHAB05lErEpIqFRLFW5b+oRU4sfx/zqZ+2jQjV8RN6TVlBIPDP5mVXU+z
 ClhkJU1lvBibBYSmZuMh+64sFqIr9BLh0gOofSYS2r0Nr2DwC/KE+ylkoltn2U2n9G/6xlQdr
 X4NUpq8g8S8w2HGjnlloQHqwxK5sO8jPuknEGFZB0Gq8YHzRj1wx3xdakTrjb0k4WkdP7g2Nm
 YQTIUkRWcewk/pAv/eelzieyhy4LwrgxPYE/FyTFn1qjdr1TNCoIiwf/4zNuwkiY+z9OFGV32
 Fc18UFaw4Y0Fg4yM+XrXnogNszseWW2bBhMVcl9K6WnRIo/syoi4xA3SjzU7eiP85zUzLigke
 4t1hpXCF0+MN7Sl5zWRuNrzN1IFJshWgbM2jJrA8Gy7huVm5vQPHJdMjzUsGTwQ47GqnIciyK
 c7rZJvJAkUMy2oSqWrpA2BkvAnCnrC1O/bQ9Ak/N5g9Skusm7Jc/oQw9tifPW86GJGIB4gFhj
 otyKfM0VHhKp740NG3/Ehbo6qN3xTaTqjC5T/sQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> camss_probe() does not free camss on error handling paths. The patch
> introduces an additional error label for this purpose.

* I suggest to use an imperative wording for the change description.

* Would you like to use also a jump target like the following
  at the end of this function implementation?

+e_nomem:
+	ret =3D -ENOMEM;
+	goto err_free;


* Will the tag =E2=80=9CFixes=E2=80=9D become helpful for the commit messa=
ge?


>                                                        Besides, it
> removes call of v4l2_async_notifier_cleanup() from
> camss_of_parse_ports() since its caller, camss_probe(), cleans up all
> its resources itself.

I propose to offer such a change by a separate update step.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3Dd15be546031cf65a0fc34879be=
ca02fd90fe7ac7#n138


Regards,
Markus
