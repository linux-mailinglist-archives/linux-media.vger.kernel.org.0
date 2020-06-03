Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFE951ED617
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 20:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgFCSYd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 14:24:33 -0400
Received: from mout.web.de ([212.227.15.3]:43251 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgFCSYc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 14:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1591208668;
        bh=ldlqw6fZ2enXKfh122KY8D+FZ5iAXrqszAST+HktABI=;
        h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
        b=k1M4SV8U8dZ6dnEFARsuhm9rbuKfGaFZQ3l6XpGqmY58RSH1tpKBGcXIP7CHzk+Y0
         /U78DFFe+YdSQ0auaRAJYiCt6Tg3Qb6LgR0DjzPIO48/ahDvEseqqXG7Spq7pkKA52
         17HDDl+v3fpM8G8wGmNrA5CL68dgnS2VB8zB2hng=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.82.231]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mq182-1jB2jZ3Dda-00nDW3; Wed, 03
 Jun 2020 20:24:27 +0200
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: budget-core: Improve exception handling in
 budget_register()
To:     Chuhong Yuan <hslester96@gmail.com>, linux-media@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e3633733-8b83-d4ef-3256-e2b1117419f0@web.de>
Date:   Wed, 3 Jun 2020 20:24:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0vjtfvANQVEJCxD5yAgbOpWL3kJVZCKugcQZ7ONucOtCa1DX6gt
 ohLfaIWaaRAVwzKMk9SOrsAqRsDfqx4qoUKYwjBuNwLCRdGd1p4AbmsCrK+b9b3dXruatII
 IWFV8ruy2JRqK1U0ad56Urqn/pxFHhbPbLG/XJ9C3gztuf/lHZqEiMSwkV8Cxp7brO8r1bF
 HXJNmkj9mBo6UF6kU5tvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ATTwrnndhE8=:mfINnM2ZJfzdQoP+cTzcU2
 S6458htOCq+lTIfo4P23O20c4XbUruOe/rbbl8DGGxQ532TmhA3jrH8Wmnn3UU8c4Ri9AzlXs
 LsoBg7e254Etf/iR51qk+dnS/LBqU9HYnI7fDs7gi91gd4GeWK873wYvSI7o3B3j4Dp05HtJP
 SlPM80tWBy9YgAffv6mABmbZmWrwSLo1G83GRejOARnkkCUOJEcL91W33l6082RwoOdN8gF2H
 p382pBrvUZL/2IFLvZvukH/LElY23yqtfTqhNk5Lkk6QFhakd3L18qLKY33VTh2cUp2frYQM2
 0ljZupw4M/SPivVik6z07IsbwcWd05ZRs/aa0lpQY+bITkJKuXoARGIewRStaIy7qhipEhqoC
 rzPAHPoS88DD6xLbrkMAuUo/K79ZZX0e5U0QeVQGn/QL9483NCJMyBMOIkPzTVgd6CnpgDi98
 +Ko4D+Voq4I3Fs+dTLEROkZ9eLSK6Vsr2Yx1aNbghndaA7dofayXddiTskOd8BuIwvbetTZng
 KT1aJ2QqeD197C/Aoz6tTqLr3dqob3H656N3EauCnHrRnjVts3QY9mrsojRPuOzDywaRkvs9x
 5sLTq6QVEXVcFQOrT5qEvoTEbAuBKb3kB+J5lSwsZkKEN3B5xU+ftBLxPQIxbmmtOBmq+ew6F
 xGFW5ol5vwg7T7QOB+tFBghtGm8K+ai0vtUxZEuN1C6tzY7vjtR5ApxTYBLdDunjRqTyXWAXU
 wOlQBx0AzHcg2EWWjORo5mHu4tVr3j8LoP0/85hdFqi4RHIW/z+BBrxbU17mGVNKdl1i/Y035
 V1E3g8vovhWBnEtgBpIL5So1QszSWLbtIw7xFn9emK15VLQt2jU/IJ60ldWnVSYSyFFAhFCfT
 OKbyNDKy+mUAuYqdZPQ5mFuWLt8L0iD0uVM9a2Gc08MKSeedA4pd+1wjQ91ARwa36yblpT6xq
 J4NrhS+AONjl4CPUbfyXovbQC3H4Qp/uraUaubLBv8H89DszRVOBCwKAFYrQsoOkCTMHpAZQ1
 cfhhnsB7vV2sGHkf/jJsrO0XJkxgKfiZa1LjSVy5hV9B++H7+Ypo2fzJaFnS71qbcHZHPx+z7
 ULu42IFiuzlHXAwaXJOI5hFvOGp+NXC3ZsAGliTVmjOLtTOMYjhIMuxJF5wFtiJ+giYyVsCg2
 go0hZA0sQyX1epuLt2hOOJTcv8ANDl0q96oQSLC2OWaZcKXW6KVF7rZ0gzeDyD4bhrobZIBlb
 8dnOKgrm93xpTlQS8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Add the missed undo functions for error handling to fix it.

=E2=80=A6
> +++ b/drivers/media/pci/ttpci/budget-core.c
> @@ -369,20 +369,25 @@  static int budget_register(struct budget *budget)
=E2=80=A6
>  	return 0;
> +
+err:
> +	dvb_dmxdev_release(&budget->dmxdev);
> +	dvb_dmx_release(&budget->demux);
> +	return ret;
>  }
=E2=80=A6

Perhaps use the label =E2=80=9Crelease_dmxdev=E2=80=9D instead?

Regards,
Markus
