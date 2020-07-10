Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5026A21BA0A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 17:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgGJP4H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 11:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgGJP4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 11:56:07 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13786C08C5CE
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 08:56:06 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e4so7035029ljn.4
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=liddicott-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0oE/tihiufGkgk0Z2LF4AuFaQzy2s5ef3+DW0mhaFB8=;
        b=HGnCoxpbSh1ggn7MUWlnhonu45mClkIMaAT4oW3AwEJz7lefYhvvvgOrbnHAdNiIBK
         mKugNUTHbp0PbZhspsiFgualPoRAfrfrBdStdEY8OhQWcovM20UfhaCCdmzqsDlIYj9T
         IMQbpZLxuBeqzXCUc8gYFUzA4pSppj1UbjqR5TVRvGy8YaK3wriaFKB59octfltgdiov
         510PG6al1ulLViwBIIFIUUzOFjmgbGxo9fKIRn2UgKzLi3IrthUqnxinl4NnFyPsDchY
         dSwhy1tzYueRT4JpdmkPE8iVBYjKdOWI71semAip8j52hqUTINsoXcs/rN2WciokXCyw
         IwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0oE/tihiufGkgk0Z2LF4AuFaQzy2s5ef3+DW0mhaFB8=;
        b=j40BENYz0NkW/mfDxGsMWf7EP0lB91rXmvqCKNeegw5NgsF0LA0/S3dAHi5brmAK7R
         Pjiphwho9WLcpY+Al/8U0fWubcYZoXkK5VjprNKPBvBXFhigHo/ywoBJkMt3vJUGnZXQ
         tXJrp0rmR7Ro1/iFy9C3FkMmUtY/2vfgSvhKNXvGMWDp2g/GlvFubkhDa5Y0l45d+iXN
         U95Ybslkqdg56DkIqeO1Fow7CyiHsRrLiZr4jEbKcRS2KUpO2ZMn9AjFSBqTNClt/RTx
         EOAprLQiOyOjUQoninjMDUkF7y8Wm2noIsFikAs+0qoTnAzjXRgpQ4kkWRKTDcQv2tAQ
         sPtQ==
X-Gm-Message-State: AOAM533jkdjlGGNysu1heofOdCI56QH9b2ujOL+vC++RFvhScCUlEGdm
        nt53VhDCtMC13YNhDXLfsNXi5p8yn4h9vrCUTzYYG/Nc4NUN/g==
X-Google-Smtp-Source: ABdhPJwF0fV3yiWs0wa1GueyXtvecm6TM0PyhsZPLkuxv5ulTEio00V3JqMKVZasViKTI7CXM2bMy72XpNgpa3Pwfn0=
X-Received: by 2002:a2e:a30f:: with SMTP id l15mr40515973lje.228.1594396562842;
 Fri, 10 Jul 2020 08:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <1594394357-7442-1-git-send-email-simon@liddicott.com>
In-Reply-To: <1594394357-7442-1-git-send-email-simon@liddicott.com>
From:   Simon Liddicott <simon@liddicott.com>
Date:   Fri, 10 Jul 2020 16:55:51 +0100
Message-ID: <CALuNSF5JKs=F71=Hpw-dF5vqqeBZrxm6S+Ckze7fi_5qYVaUNw@mail.gmail.com>
Subject: Re: [PATCH 1/1] dtv-scan-tables: Full UK update
To:     linux-media <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        oliver@schinagl.nl
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For some reason my patches never turn up on patchwork.

UK frequencies haven't been updated for some time. Here is a complete update.

Si.


On Fri, 10 Jul 2020 at 16:20, Simon Liddicott <simon@liddicott.com> wrote:
>
> Complete UK update for all transmitters.
>
> Signed-off-by: Simon Liddicott <simon@liddicott.com>
> ---
>  dvb-t/uk-Aberdare                 | 30 ++++++++++----------
>  dvb-t/uk-Angus                    | 49 ++++++++++++---------------------
>  dvb-t/uk-BeaconHill               | 46 +++++++------------------------
>  dvb-t/uk-Belmont                  | 37 ++++++++-----------------
>  dvb-t/uk-Bilsdale                 | 37 ++++++++-----------------
>  dvb-t/uk-BlackHill                | 29 ++++++--------------
>  dvb-t/uk-Blaenplwyf               | 30 ++++++++++----------
>  dvb-t/uk-BluebellHill             | 25 ++++-------------
>  dvb-t/uk-Bressay                  | 30 ++++++++++----------
>  dvb-t/uk-BrierleyHill             | 30 ++++++++++----------
>  dvb-t/uk-BristolIlchesterCrescent | 34 +++++++++++------------
>  dvb-t/uk-BristolKingsWeston       | 46 +++++++++++++++----------------
>  dvb-t/uk-Bromsgrove               | 30 ++++++++++----------
>  dvb-t/uk-BrougherMountain         | 46 +++++++++++++++----------------
>  dvb-t/uk-Caldbeck                 | 58 +++++++++++----------------------------
>  dvb-t/uk-CaradonHill              | 34 +++--------------------
>  dvb-t/uk-Carmel                   | 50 ++++++++++++++++-----------------
>  dvb-t/uk-Chatton                  | 50 ++++++++++++++++-----------------
>  dvb-t/uk-Chesterfield             | 38 ++++++++++++-------------
>  dvb-t/uk-Craigkelly               | 41 ++++++++++-----------------
>  dvb-t/uk-CrystalPalace            | 25 ++++-------------
>  dvb-t/uk-Darvel                   | 41 ++++++++++-----------------
>  dvb-t/uk-Divis                    | 29 ++++++--------------
>  dvb-t/uk-Dover                    | 46 +++++++++++++++----------------
>  dvb-t/uk-Durris                   | 29 ++++++--------------
>  dvb-t/uk-Eitshal                  | 30 ++++++++++----------
>  dvb-t/uk-EmleyMoor                | 37 ++++++++-----------------
>  dvb-t/uk-Fenham                   | 48 ++++++++++++--------------------
>  dvb-t/uk-Fenton                   | 25 ++++-------------
>  dvb-t/uk-Ferryside                | 36 ++++++++++++------------
>  dvb-t/uk-Guildford                | 30 ++++++++++----------
>  dvb-t/uk-Hannington               | 27 +++++-------------
>  dvb-t/uk-Hastings                 | 30 ++++++++++----------
>  dvb-t/uk-Heathfield               | 30 ++++++++++----------
>  dvb-t/uk-HemelHempstead           | 32 ++++++++++++++-------
>  dvb-t/uk-HuntshawCross            | 50 ++++++++++++++++-----------------
>  dvb-t/uk-Idle                     | 50 ++++++++++++++++-----------------
>  dvb-t/uk-KeelylangHill            | 30 ++++++++++----------
>  dvb-t/uk-Keighley                 | 50 ++++++++++++++++-----------------
>  dvb-t/uk-KilveyHill               | 42 ++++++++++++++--------------
>  dvb-t/uk-KnockMore                | 30 ++++++++++----------
>  dvb-t/uk-Lancaster                | 30 ++++++++++----------
>  dvb-t/uk-LarkStoke                | 30 ++++++++++----------
>  dvb-t/uk-Limavady                 | 50 ++++++++++++++++-----------------
>  dvb-t/uk-Llanddona                | 50 ++++++++++++++++-----------------
>  dvb-t/uk-Malvern                  | 30 ++++++++++----------
>  dvb-t/uk-Mendip                   | 41 ++++++++++-----------------
>  dvb-t/uk-Midhurst                 | 38 ++++++++++++-------------
>  dvb-t/uk-MoelyParc                | 33 +++++++---------------
>  dvb-t/uk-Nottingham               | 42 ++++++++++++++--------------
>  dvb-t/uk-OliversMount             | 54 ++++++++++++++++++------------------
>  dvb-t/uk-Oxford                   | 25 ++++-------------
>  dvb-t/uk-PendleForest             | 30 ++++++++++----------
>  dvb-t/uk-Plympton                 | 50 ++++++++++++++++-----------------
>  dvb-t/uk-PontopPike               | 49 ++++++++++++---------------------
>  dvb-t/uk-Pontypool                | 30 ++++++++++----------
>  dvb-t/uk-Preseli                  | 30 ++++++++++----------
>  dvb-t/uk-Redruth                  | 38 ++++++++++++-------------
>  dvb-t/uk-Reigate                  | 32 ++++++++++++++-------
>  dvb-t/uk-RidgeHill                | 25 ++++-------------
>  dvb-t/uk-Rosemarkie               | 30 ++++++++++----------
>  dvb-t/uk-Rosneath                 | 52 +++++++++++++++++------------------
>  dvb-t/uk-Rowridge                 | 25 ++++-------------
>  dvb-t/uk-RumsterForest            | 30 ++++++++++----------
>  dvb-t/uk-Saddleworth              | 30 ++++++++++----------
>  dvb-t/uk-Salisbury                | 30 ++++++++++----------
>  dvb-t/uk-SandyHeath               | 29 ++++++--------------
>  dvb-t/uk-Selkirk                  | 46 +++++++++++++++----------------
>  dvb-t/uk-Sheffield                | 38 ++++---------------------
>  dvb-t/uk-StocklandHill            | 30 ++++++++++----------
>  dvb-t/uk-Storeton                 | 30 ++++++++++----------
>  dvb-t/uk-Sudbury                  | 30 ++++++++++----------
>  dvb-t/uk-SuttonColdfield          | 25 ++++-------------
>  dvb-t/uk-Tacolneston              | 25 ++++-------------
>  dvb-t/uk-TheWrekin                | 30 ++++++++++----------
>  dvb-t/uk-Torosay                  | 30 ++++++++++----------
>  dvb-t/uk-TunbridgeWells           | 30 ++++++++++----------
>  dvb-t/uk-Waltham                  | 41 ++++++++++-----------------
>  dvb-t/uk-Wenvoe                   | 29 ++++++--------------
>  dvb-t/uk-WhitehawkHill            | 46 +++++++++++++++----------------
>  dvb-t/uk-WinterHill               | 31 ++++++---------------
>  81 files changed, 1246 insertions(+), 1665 deletions(-)
>
> diff --git a/dvb-t/uk-Aberdare b/dvb-t/uk-Aberdare
> index 2b4d04a..3fde661 100644
> --- a/dvb-t/uk-Aberdare
> +++ b/dvb-t/uk-Aberdare
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/CF44+0DA/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CF44 0DA>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Aberdare
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C24- BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C27- BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 521833000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C25+ SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 506167000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C27- BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 521833000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Angus b/dvb-t/uk-Angus
> index c4c113b..5cd0e29 100644
> --- a/dvb-t/uk-Angus
> +++ b/dvb-t/uk-Angus
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/DD4 0RQ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/DD4 0RQ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Angus
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C60- BBC A]
> +[C39 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 785833000
> +       FREQUENCY = 618000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C53 D3&4]
> +[C42 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 730000000
> +       FREQUENCY = 642000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C31 COM7 HD]
> +[C45 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 554000000
> +       FREQUENCY = 666000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -43,9 +43,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C54 SDN]
> +[C33 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 738000000
> +       FREQUENCY = 570000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -55,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C58 ARQ A]
> +[C36 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 770000000
> +       FREQUENCY = 594000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -67,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C49 ARQ B]
> +[C48 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 698000000
> +       FREQUENCY = 690000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,9 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C57 BBC B HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 762000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -92,22 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C37 COM8 HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 602000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C48 L-STV]
> +[C34 L-STV]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 690000000
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-BeaconHill b/dvb-t/uk-BeaconHill
> index 764a7e2..9215cd2 100644
> --- a/dvb-t/uk-BeaconHill
> +++ b/dvb-t/uk-BeaconHill
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/TQ3 1RT/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TQ3 1RT>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Beacon Hill
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C60- BBC A]
> +[C44 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 785833000
> +       FREQUENCY = 658000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C53+ D3&4]
> +[C41 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 730167000
> +       FREQUENCY = 634000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C33 COM7 HD]
> +[C47 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 570000000
> +       FREQUENCY = 682000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -67,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C51 ARQ B]
> +[C40 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 714000000
> +       FREQUENCY = 626000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,29 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C57+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 762167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C34 COM8 HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 578000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Belmont b/dvb-t/uk-Belmont
> index 38843f6..a201485 100644
> --- a/dvb-t/uk-Belmont
> +++ b/dvb-t/uk-Belmont
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/LN8 6JT/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/LN8 6JT>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Belmont
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C22 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C33 COM7 HD]
> +[C28 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 570000000
> +       FREQUENCY = 530000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -55,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C53 ARQ A]
> +[C23 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 730000000
> +       FREQUENCY = 490000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -67,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C60- ARQ B]
> +[C26 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 785833000
> +       FREQUENCY = 514000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C28 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 530000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C35 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 586000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -105,9 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C27 L-GMB]
> +[C32 L-GMB]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 522000000
> +       FREQUENCY = 562000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Bilsdale b/dvb-t/uk-Bilsdale
> index d2f0bda..f9f253f 100644
> --- a/dvb-t/uk-Bilsdale
> +++ b/dvb-t/uk-Bilsdale
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/TS9 7JS/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TS9 7JS>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Bilsdale
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C26 BBC A]
> +[C27 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 514000000
> +       FREQUENCY = 522000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C29 D3&4]
> +[C24 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 538000000
> +       FREQUENCY = 498000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C31 COM7 HD]
> +[C21 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 554000000
> +       FREQUENCY = 474000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,9 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C23 BBC B HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 490000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -92,22 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C37 COM8 HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 602000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C24 L-MDB]
> +[C30 L-MDB]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 498000000
> +       FREQUENCY = 546000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-BlackHill b/dvb-t/uk-BlackHill
> index 2f3f4ad..6251213 100644
> --- a/dvb-t/uk-BlackHill
> +++ b/dvb-t/uk-BlackHill
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/ML7 4NZ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/ML7 4NZ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Black Hill
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C46 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C32 COM7 HD]
> +[C40 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 562000000
> +       FREQUENCY = 626000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C40 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 626000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C35 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 586000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -105,9 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C51 L-STV]
> +[C30 L-STV]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 714000000
> +       FREQUENCY = 546000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Blaenplwyf b/dvb-t/uk-Blaenplwyf
> index f162941..1829f82 100644
> --- a/dvb-t/uk-Blaenplwyf
> +++ b/dvb-t/uk-Blaenplwyf
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/SY23 4QH/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SY23 4QH>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Blaenplwyf
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C27 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C21+ BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 474167000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C25 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 506000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 474167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-BluebellHill b/dvb-t/uk-BluebellHill
> index d3332c0..0cd391f 100644
> --- a/dvb-t/uk-BluebellHill
> +++ b/dvb-t/uk-BluebellHill
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/ME5 9RD/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/ME5 9RD>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Bluebell Hill
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C32 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C45 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 666000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C45 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 666000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Bressay b/dvb-t/uk-Bressay
> index 56b2d22..bea3995 100644
> --- a/dvb-t/uk-Bressay
> +++ b/dvb-t/uk-Bressay
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/ZE2 9EL/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/ZE2 9EL>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Bressay
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C28 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C22+ BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 482167000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C27 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 522000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C22+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 482167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-BrierleyHill b/dvb-t/uk-BrierleyHill
> index 4785e8f..d4c96aa 100644
> --- a/dvb-t/uk-BrierleyHill
> +++ b/dvb-t/uk-BrierleyHill
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/DY5 2PD/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/DY5 2PD>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Brierley Hill
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C32 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C35 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 586000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C29 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 538000000
> @@ -66,19 +79,6 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C35 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 586000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
>  [C33 L-BRM]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 570000000
> diff --git a/dvb-t/uk-BristolIlchesterCrescent b/dvb-t/uk-BristolIlchesterCrescent
> index 9204a3c..d9c9797 100644
> --- a/dvb-t/uk-BristolIlchesterCrescent
> +++ b/dvb-t/uk-BristolIlchesterCrescent
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/BS13 7HU/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BS13 7HU>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Bristol Ilchester Crescent
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C41+ BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C47 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 682000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C42+ SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 642167000
> @@ -66,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C47 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 682000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C30 L-BSL]
> +[C37 L-BSL]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 546000000
> +       FREQUENCY = 602000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-BristolKingsWeston b/dvb-t/uk-BristolKingsWeston
> index aaedfd8..b2b24d5 100644
> --- a/dvb-t/uk-BristolKingsWeston
> +++ b/dvb-t/uk-BristolKingsWeston
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/BS9 2QY/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BS9 2QY>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Bristol Kings Weston
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C43 BBC A]
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C53 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 730000000
> +[C46 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 674000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C57 ARQ A]
> +[C22 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 762000000
> +       FREQUENCY = 482000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C60- ARQ B]
> +[C25 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 785833000
> +       FREQUENCY = 506000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,22 +67,21 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C46 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 674000000
> +[C28 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 530000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C30 L-BSL]
> +[C31 L-BSL]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 546000000
> +       FREQUENCY = 554000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Bromsgrove b/dvb-t/uk-Bromsgrove
> index 8e7d198..b6e4593 100644
> --- a/dvb-t/uk-Bromsgrove
> +++ b/dvb-t/uk-Bromsgrove
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/B61 9JD/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/B61 9JD>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Bromsgrove
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C26 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C30- BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 545833000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C33 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 570000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C30- BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 545833000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-BrougherMountain b/dvb-t/uk-BrougherMountain
> index efb588b..451af71 100644
> --- a/dvb-t/uk-BrougherMountain
> +++ b/dvb-t/uk-BrougherMountain
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/BT78 3SG/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BT78 3SG>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Brougher Mountain
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C28 BBC A]
> +[C29 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 530000000
> +       FREQUENCY = 538000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C22+ D3&4]
> +[C31 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 482167000
> +       FREQUENCY = 554000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,9 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21+ SDN]
> +[C37 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 602000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
> +[C21 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 474167000
> +       FREQUENCY = 474000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C25 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 506000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C30- NI mux]
> +[C30 NI mux]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 545833000
> +       FREQUENCY = 546000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Caldbeck b/dvb-t/uk-Caldbeck
> index e0e183e..83e6200 100644
> --- a/dvb-t/uk-Caldbeck
> +++ b/dvb-t/uk-Caldbeck
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/CA7 8DW/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CA7 8DW>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Caldbeck
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C25- BBC A]
> +[C25 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 505833000
> +       FREQUENCY = 506000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C28- D3&4]
> +[C28 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 529833000
> +       FREQUENCY = 530000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C32 COM7 HD]
> +[C22 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 562000000
> +       FREQUENCY = 482000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -43,9 +43,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C23- SDN]
> +[C23 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 489833000
> +       FREQUENCY = 490000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -55,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C26- ARQ A]
> +[C26 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 513833000
> +       FREQUENCY = 514000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -67,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C29- ARQ B]
> +[C30 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 537833000
> +       FREQUENCY = 546000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,35 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C30- BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 545833000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C35 COM8 HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 586000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 L-CRL]
> +[C29 L-CRL]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 754000000
> +       FREQUENCY = 538000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-CaradonHill b/dvb-t/uk-CaradonHill
> index 6405992..d473846 100644
> --- a/dvb-t/uk-CaradonHill
> +++ b/dvb-t/uk-CaradonHill
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/PL14 5LT/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/PL14 5LT>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Caradon Hill
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C28+ BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C31 COM7 HD]
> +[C22+ BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 554000000
> +       FREQUENCY = 482167000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,29 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C22+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 482167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C37 COM8 HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 602000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Carmel b/dvb-t/uk-Carmel
> index 279cee6..009b8c8 100644
> --- a/dvb-t/uk-Carmel
> +++ b/dvb-t/uk-Carmel
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/SA14 7NA/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SA14 7NA>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Carmel
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C60- BBC A]
> +[C23 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 785833000
> +       FREQUENCY = 490000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C53 D3&4]
> +[C26 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 730000000
> +       FREQUENCY = 514000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C54 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 738000000
> +[C29 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 538000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C58 ARQ A]
> +[C33 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 770000000
> +       FREQUENCY = 570000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C49 ARQ B]
> +[C36 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 698000000
> +       FREQUENCY = 594000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +67,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C57 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 762000000
> +[C48 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 690000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-Chatton b/dvb-t/uk-Chatton
> index b8f7706..2357ffd 100644
> --- a/dvb-t/uk-Chatton
> +++ b/dvb-t/uk-Chatton
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/NE67 5JD/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/NE67 5JD>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Chatton
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C45 BBC A]
> +[C41 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 666000000
> +       FREQUENCY = 634000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C42 D3&4]
> +[C44 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 642000000
> +       FREQUENCY = 658000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C41 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 634000000
> +[C47 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 682000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C44 ARQ A]
> +[C29 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 658000000
> +       FREQUENCY = 538000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C47 ARQ B]
> +[C31 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 682000000
> +       FREQUENCY = 554000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +67,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C39+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 618167000
> +[C37 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 602000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-Chesterfield b/dvb-t/uk-Chesterfield
> index b372e13..06d4f0f 100644
> --- a/dvb-t/uk-Chesterfield
> +++ b/dvb-t/uk-Chesterfield
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/S18 4BT/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/S18 4BT>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Chesterfield
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C26 BBC A]
> +[C31 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 514000000
> +       FREQUENCY = 554000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C23 D3&4]
> +[C37 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 490000000
> +       FREQUENCY = 602000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C29 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 538000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C43 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 650000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C29 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 538000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Craigkelly b/dvb-t/uk-Craigkelly
> index 0cbc671..58dc989 100644
> --- a/dvb-t/uk-Craigkelly
> +++ b/dvb-t/uk-Craigkelly
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/KY3 9HW/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/KY3 9HW>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Craigkelly
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C27 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C33 COM7 HD]
> +[C21+ BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 570000000
> +       FREQUENCY = 474167000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -43,9 +43,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C42 SDN]
> +[C29 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 642000000
> +       FREQUENCY = 538000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -55,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C45 ARQ A]
> +[C31 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 666000000
> +       FREQUENCY = 554000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -67,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C39+ ARQ B]
> +[C37 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 618167000
> +       FREQUENCY = 602000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 474167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C34 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 578000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -105,9 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C30 L-STV]
> +[C32 L-STV]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 546000000
> +       FREQUENCY = 562000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-CrystalPalace b/dvb-t/uk-CrystalPalace
> index 93dafc4..3d0730f 100644
> --- a/dvb-t/uk-CrystalPalace
> +++ b/dvb-t/uk-CrystalPalace
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/SE19 1UE/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SE19 1UE>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Crystal Palace
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C23 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C30- BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 545833000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C30- BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 545833000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Darvel b/dvb-t/uk-Darvel
> index 1194a07..0e5c685 100644
> --- a/dvb-t/uk-Darvel
> +++ b/dvb-t/uk-Darvel
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/KA16 9LS/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/KA16 9LS>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Darvel
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C22- BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C31 COM7 HD]
> +[C28 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 554000000
> +       FREQUENCY = 530000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -43,9 +43,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C23 SDN]
> +[C32 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 490000000
> +       FREQUENCY = 562000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -55,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C26 ARQ A]
> +[C34 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 514000000
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -67,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C29 ARQ B]
> +[C35 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 538000000
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,9 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C28 BBC B HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 530000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -92,22 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C37 COM8 HD]
> +[C31 L-STV]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 602000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C30 L-STV]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 546000000
> +       FREQUENCY = 554000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Divis b/dvb-t/uk-Divis
> index 2ae8073..5170949 100644
> --- a/dvb-t/uk-Divis
> +++ b/dvb-t/uk-Divis
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/BT17 0NG/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BT17 0NG>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Divis
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C27 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C33 COM7 HD]
> +[C24 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 570000000
> +       FREQUENCY = 498000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -67,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C29 ARQ B]
> +[C30 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 538000000
> +       FREQUENCY = 546000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C24 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 498000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C34 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 578000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Dover b/dvb-t/uk-Dover
> index c36cefe..bc2de5d 100644
> --- a/dvb-t/uk-Dover
> +++ b/dvb-t/uk-Dover
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/CT15 7AQ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CT15 7AQ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Dover
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C50 BBC A]
> +[C33 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 706000000
> +       FREQUENCY = 570000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C51 D3&4]
> +[C35 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 714000000
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,9 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C35 SDN]
> +[C36 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 594000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
> +[C39 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 586000000
> +       FREQUENCY = 618000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -42,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C59 ARQ A]
> +[C42 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 778000000
> +       FREQUENCY = 642000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C53 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 730000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Durris b/dvb-t/uk-Durris
> index 3ec1644..f0d574b 100644
> --- a/dvb-t/uk-Durris
> +++ b/dvb-t/uk-Durris
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/AB39 3TH/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/AB39 3TH>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Durris
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C28 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C22 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 482000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -67,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C29 ARQ B]
> +[C30 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 538000000
> +       FREQUENCY = 546000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C22 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 482000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Eitshal b/dvb-t/uk-Eitshal
> index e31c6bf..bdb8d27 100644
> --- a/dvb-t/uk-Eitshal
> +++ b/dvb-t/uk-Eitshal
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/HS2 9JW/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/HS2 9JW>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Eitshal
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C26 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C29 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 538000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C25 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 506000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C29 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 538000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-EmleyMoor b/dvb-t/uk-EmleyMoor
> index 77c585b..07c0cf8 100644
> --- a/dvb-t/uk-EmleyMoor
> +++ b/dvb-t/uk-EmleyMoor
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/HD8 9TF/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/HD8 9TF>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Emley Moor
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C47 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C32 COM7 HD]
> +[C41 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 562000000
> +       FREQUENCY = 634000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -43,9 +43,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C51 SDN]
> +[C33 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 714000000
> +       FREQUENCY = 570000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -55,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C52 ARQ A]
> +[C36 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 722000000
> +       FREQUENCY = 594000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C41 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 634000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C34 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 578000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -105,9 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C56 L-LDS]
> +[C39 L-LDS]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 754000000
> +       FREQUENCY = 618000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Fenham b/dvb-t/uk-Fenham
> index db4f87f..8405179 100644
> --- a/dvb-t/uk-Fenham
> +++ b/dvb-t/uk-Fenham
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/NE15 6PL/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/NE15 6PL>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Fenham
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C27 BBC A]
> +[C23 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 522000000
> +       FREQUENCY = 490000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C24 D3&4]
> +[C26 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 498000000
> +       FREQUENCY = 514000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C31 COM7 HD]
> +[C30 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 554000000
> +       FREQUENCY = 546000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -55,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C22+ ARQ A]
> +[C22 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 482167000
> +       FREQUENCY = 482000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,29 +79,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 474167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C37 COM8 HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 602000000
> +[C36 L-NCL]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 594000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QPSK
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-Fenton b/dvb-t/uk-Fenton
> index b4f6e2e..ea9a9eb 100644
> --- a/dvb-t/uk-Fenton
> +++ b/dvb-t/uk-Fenton
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/ST4 2NX/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/ST4 2NX>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Fenton
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C24 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C21+ BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 474167000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 474167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Ferryside b/dvb-t/uk-Ferryside
> index 1eb0a06..48dd037 100644
> --- a/dvb-t/uk-Ferryside
> +++ b/dvb-t/uk-Ferryside
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/SA17+5UR/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SA17 5UR>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Ferryside
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C21+ BBC A]
> +[C21 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 474167000
> +       FREQUENCY = 474000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,23 +18,11 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C30- D3&4]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 545833000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> -       HIERARCHY = NONE
> -       INVERSION = AUTO
> -
> -[C27 SDN]
> +[C27 D3&4]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 522000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
>         MODULATION = QAM/64
>         TRANSMISSION_MODE = 8K
> @@ -55,3 +43,15 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> +[C28 SDN]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 530000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 3/4
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
> +       HIERARCHY = NONE
> +       INVERSION = AUTO
> +
> diff --git a/dvb-t/uk-Guildford b/dvb-t/uk-Guildford
> index 6832c68..ef0df6b 100644
> --- a/dvb-t/uk-Guildford
> +++ b/dvb-t/uk-Guildford
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/GU2 7RW/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/GU2 7RW>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Guildford
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C41 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C47 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 682000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C37 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 602000000
> @@ -66,19 +79,6 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C47 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 682000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
>  [C33 L-GFD]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 570000000
> diff --git a/dvb-t/uk-Hannington b/dvb-t/uk-Hannington
> index c773a5c..d04f43b 100644
> --- a/dvb-t/uk-Hannington
> +++ b/dvb-t/uk-Hannington
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/RG26 5UD/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/RG26 5UD>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Hannington
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C45 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C39 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 618000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C39 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 618000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -105,7 +92,7 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C34 L-BSG / L-RDG]
> +[C34 L-RDG]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
> diff --git a/dvb-t/uk-Hastings b/dvb-t/uk-Hastings
> index 6c75e20..da9408d 100644
> --- a/dvb-t/uk-Hastings
> +++ b/dvb-t/uk-Hastings
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/TN34 1LE/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TN34 1LE>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Hastings
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C25 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C22 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 482000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C23 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 490000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C22 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 482000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Heathfield b/dvb-t/uk-Heathfield
> index 67e4f94..0331e82 100644
> --- a/dvb-t/uk-Heathfield
> +++ b/dvb-t/uk-Heathfield
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/TN21 0UG/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TN21 0UG>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Heathfield
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C41 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C47 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 682000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C40 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 626000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C47 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 682000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-HemelHempstead b/dvb-t/uk-HemelHempstead
> index 3116889..af1e694 100644
> --- a/dvb-t/uk-HemelHempstead
> +++ b/dvb-t/uk-HemelHempstead
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/HP3 8SA/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/HP3 8SA>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Hemel Hempstead
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C40 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C46 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 674000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C37 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 602000000
> @@ -66,16 +79,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C46 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 674000000
> +[C34 L-LON]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QPSK
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-HuntshawCross b/dvb-t/uk-HuntshawCross
> index c1f4ce2..910fdf5 100644
> --- a/dvb-t/uk-HuntshawCross
> +++ b/dvb-t/uk-HuntshawCross
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/EX31 3ND/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/EX31 3ND>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Huntshaw Cross
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C50 BBC A]
> +[C30 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 706000000
> +       FREQUENCY = 546000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C59- D3&4]
> +[C31 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 777833000
> +       FREQUENCY = 554000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C48 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 690000000
> +[C37 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 602000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C52 ARQ A]
> +[C32 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 722000000
> +       FREQUENCY = 562000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C56+ ARQ B]
> +[C34 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 754167000
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +67,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55- BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 745833000
> +[C35 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-Idle b/dvb-t/uk-Idle
> index f88e32a..0c989b7 100644
> --- a/dvb-t/uk-Idle
> +++ b/dvb-t/uk-Idle
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/BD18 1JP/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BD18 1JP>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Idle
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C24 BBC A]
> +[C23 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 498000000
> +       FREQUENCY = 490000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21 D3&4]
> +[C26 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 474000000
> +       FREQUENCY = 514000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C42 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 642000000
> +[C30 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 546000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C45 ARQ A]
> +[C32 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 666000000
> +       FREQUENCY = 562000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C39 ARQ B]
> +[C35 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 618000000
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +67,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C27 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 522000000
> +[C34 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-KeelylangHill b/dvb-t/uk-KeelylangHill
> index 888b508..1da1dee 100644
> --- a/dvb-t/uk-KeelylangHill
> +++ b/dvb-t/uk-KeelylangHill
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/KW15 1SF/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/KW15 1SF>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Keelylang Hill
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C46 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C40+ BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 626167000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C42 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 642000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C40+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 626167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Keighley b/dvb-t/uk-Keighley
> index b341c65..ddb069a 100644
> --- a/dvb-t/uk-Keighley
> +++ b/dvb-t/uk-Keighley
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/BD20 5RL/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BD20 5RL>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Keighley
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C49 BBC A]
> +[C40 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 698000000
> +       FREQUENCY = 626000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C58 D3&4]
> +[C43 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 770000000
> +       FREQUENCY = 650000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C57 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 762000000
> +[C46 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 674000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C53 ARQ A]
> +[C29 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 730000000
> +       FREQUENCY = 538000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C60- ARQ B]
> +[C31 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 785833000
> +       FREQUENCY = 554000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +67,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C54 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 738000000
> +[C37 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 602000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-KilveyHill b/dvb-t/uk-KilveyHill
> index ce1c48c..eda445f 100644
> --- a/dvb-t/uk-KilveyHill
> +++ b/dvb-t/uk-KilveyHill
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/SA1 7BL/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SA1 7BL>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Kilvey Hill
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C23 BBC A]
> +[C21 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 490000000
> +       FREQUENCY = 474000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C26 D3&4]
> +[C24 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 514000000
> +       FREQUENCY = 498000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C27 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 522000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C25 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 506000000
> @@ -66,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C29 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 538000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C30 L-SWA]
> +[C34 L-SWA]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 546000000
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-KnockMore b/dvb-t/uk-KnockMore
> index 41bf6f1..0cebedf 100644
> --- a/dvb-t/uk-KnockMore
> +++ b/dvb-t/uk-KnockMore
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/AB55 6XP/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/AB55 6XP>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Knockmore
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C31 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C29 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 538000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C33 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 570000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C29 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 538000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Lancaster b/dvb-t/uk-Lancaster
> index 2cbacd2..af2dc02 100644
> --- a/dvb-t/uk-Lancaster
> +++ b/dvb-t/uk-Lancaster
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/LA5 8AF/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/LA5 8AF>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Lancaster
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C27- BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C21+ BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 474167000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C25+ SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 506167000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 474167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-LarkStoke b/dvb-t/uk-LarkStoke
> index 3030e6c..e297e6d 100644
> --- a/dvb-t/uk-LarkStoke
> +++ b/dvb-t/uk-LarkStoke
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/GL55 6LS/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/GL55 6LS>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Lark Stoke
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C26 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C30- BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 545833000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C33 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 570000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C30- BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 545833000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Limavady b/dvb-t/uk-Limavady
> index adead64..ea3447a 100644
> --- a/dvb-t/uk-Limavady
> +++ b/dvb-t/uk-Limavady
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/BT49 9LJ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BT49 9LJ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Limavady
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C50 BBC A]
> +[C41 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 706000000
> +       FREQUENCY = 634000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C59 D3&4]
> +[C44 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 778000000
> +       FREQUENCY = 658000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C54 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 738000000
> +[C47 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 682000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C58 ARQ A]
> +[C40 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 770000000
> +       FREQUENCY = 626000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C49 ARQ B]
> +[C43 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 698000000
> +       FREQUENCY = 650000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +67,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +[C46 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 674000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-Llanddona b/dvb-t/uk-Llanddona
> index 9d64c26..439b4d3 100644
> --- a/dvb-t/uk-Llanddona
> +++ b/dvb-t/uk-Llanddona
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/LL58 8YB/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/LL58 8YB>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Llanddona
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C57 BBC A]
> +[C40 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 762000000
> +       FREQUENCY = 626000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C60- D3&4]
> +[C43 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 785833000
> +       FREQUENCY = 650000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C43 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 650000000
> +[C46 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 674000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C46 ARQ A]
> +[C41 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 674000000
> +       FREQUENCY = 634000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C40 ARQ B]
> +[C44 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 626000000
> +       FREQUENCY = 658000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +67,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C53 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 730000000
> +[C47 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 682000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-Malvern b/dvb-t/uk-Malvern
> index 4786ce9..735cd0b 100644
> --- a/dvb-t/uk-Malvern
> +++ b/dvb-t/uk-Malvern
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/WR14 4AD/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/WR14 4AD>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Malvern
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C41 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C47 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 682000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C29 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 538000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C47 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 682000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Mendip b/dvb-t/uk-Mendip
> index 4806b7e..ae55fe8 100644
> --- a/dvb-t/uk-Mendip
> +++ b/dvb-t/uk-Mendip
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/BA5 3LB/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BA5 3LB>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Mendip
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C49 BBC A]
> +[C32 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 698000000
> +       FREQUENCY = 562000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C54 D3&4]
> +[C34 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 738000000
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C36 COM7 HD]
> +[C35 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 594000000
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -67,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C52 ARQ B]
> +[C36 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 722000000
> +       FREQUENCY = 594000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C58 BBC B HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 770000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C35 COM8 HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 586000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -105,9 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C51 L-BSL]
> +[C30 L-BSL]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 714000000
> +       FREQUENCY = 546000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Midhurst b/dvb-t/uk-Midhurst
> index 1912c06..7848b9c 100644
> --- a/dvb-t/uk-Midhurst
> +++ b/dvb-t/uk-Midhurst
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/GU28 9EA/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/GU28 9EA>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Midhurst
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C48 BBC A]
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C54 D3&4]
> +[C35 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 738000000
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C36 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 594000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C29 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 538000000
> @@ -42,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C59 ARQ A]
> +[C34 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 778000000
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C58 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 770000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-MoelyParc b/dvb-t/uk-MoelyParc
> index 7b5f4de..39655a0 100644
> --- a/dvb-t/uk-MoelyParc
> +++ b/dvb-t/uk-MoelyParc
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/CH7 5UU/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CH7 5UU>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Moel y Parc
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C45 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C32 COM7 HD]
> +[C42 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 562000000
> +       FREQUENCY = 642000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -55,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C52+ ARQ A]
> +[C36 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 722167000
> +       FREQUENCY = 594000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C42 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 642000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C34 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 578000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -105,9 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C56 L-MLD]
> +[C27 L-MLD]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 754000000
> +       FREQUENCY = 522000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Nottingham b/dvb-t/uk-Nottingham
> index 8d20912..a6bc12e 100644
> --- a/dvb-t/uk-Nottingham
> +++ b/dvb-t/uk-Nottingham
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/NG16 2SU/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/NG16 2SU>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Nottingham
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C27 BBC A]
> @@ -30,9 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C51 SDN]
> +[C21 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 474000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
> +[C33 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 714000000
> +       FREQUENCY = 570000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -42,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C52 ARQ A]
> +[C36 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 722000000
> +       FREQUENCY = 594000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 474167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C50 L-NOT]
> +[C44 L-NOT]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 706000000
> +       FREQUENCY = 658000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-OliversMount b/dvb-t/uk-OliversMount
> index 64bc313..9ea2d8b 100644
> --- a/dvb-t/uk-OliversMount
> +++ b/dvb-t/uk-OliversMount
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/YO11 2TZ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/YO11 2TZ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Olivers Mount
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C57 BBC A]
> +[C29 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 762000000
> +       FREQUENCY = 538000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C60- D3&4]
> +[C31 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 785833000
> +       FREQUENCY = 554000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C54 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 738000000
> +[C37 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 602000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C58 ARQ A]
> +[C32 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 770000000
> +       FREQUENCY = 562000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C49 ARQ B]
> +[C34 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 698000000
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,22 +67,21 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C53 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 730000000
> +[C35 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C56 L-SCA]
> +[C39 L-SCA]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 754000000
> +       FREQUENCY = 618000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Oxford b/dvb-t/uk-Oxford
> index d0bf62f..f509450 100644
> --- a/dvb-t/uk-Oxford
> +++ b/dvb-t/uk-Oxford
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/OX3 9SS/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/OX3 9SS>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Oxford
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C41 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C47 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 682000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C47 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 682000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-PendleForest b/dvb-t/uk-PendleForest
> index 0ce89f4..0b320d1 100644
> --- a/dvb-t/uk-PendleForest
> +++ b/dvb-t/uk-PendleForest
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/BB12 9PW/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BB12 9PW>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Pendle Forest
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C28+ BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C22+ BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 482167000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C27- SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 521833000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C22+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 482167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Plympton b/dvb-t/uk-Plympton
> index b8adcae..540c409 100644
> --- a/dvb-t/uk-Plympton
> +++ b/dvb-t/uk-Plympton
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/PL7 1TT/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/PL7 1TT>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Plympton
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C54 BBC A]
> +[C40 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 738000000
> +       FREQUENCY = 626000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C49 D3&4]
> +[C42 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 698000000
> +       FREQUENCY = 642000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C42 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 642000000
> +[C45 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 666000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C45 ARQ A]
> +[C41 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 666000000
> +       FREQUENCY = 634000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C56 ARQ B]
> +[C44 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 754000000
> +       FREQUENCY = 658000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +67,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C58 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 770000000
> +[C47 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 682000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-PontopPike b/dvb-t/uk-PontopPike
> index 6a563d8..3749797 100644
> --- a/dvb-t/uk-PontopPike
> +++ b/dvb-t/uk-PontopPike
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/DH9 9AT/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/DH9 9AT>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Pontop Pike
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C58 BBC A]
> +[C39 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 770000000
> +       FREQUENCY = 618000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C54 D3&4]
> +[C42 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 738000000
> +       FREQUENCY = 642000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C33 COM7 HD]
> +[C45 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 570000000
> +       FREQUENCY = 666000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -43,9 +43,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C50 SDN]
> +[C32 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 706000000
> +       FREQUENCY = 562000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -55,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C59 ARQ A]
> +[C34 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 778000000
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -67,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 ARQ B]
> +[C35 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 746000000
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C49 BBC B HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 698000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C34 COM8 HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 578000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -105,9 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C56 L-NCL]
> +[C33 L-NCL]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 754000000
> +       FREQUENCY = 570000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Pontypool b/dvb-t/uk-Pontypool
> index 191c353..2ef908e 100644
> --- a/dvb-t/uk-Pontypool
> +++ b/dvb-t/uk-Pontypool
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/NP4 5XJ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/NP4 5XJ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Pontypool
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C23+ BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C29+ BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 538167000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C25- SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 505833000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C29+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 538167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Preseli b/dvb-t/uk-Preseli
> index 20b75db..8fd8b7d 100644
> --- a/dvb-t/uk-Preseli
> +++ b/dvb-t/uk-Preseli
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/SA41 3QR/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SA41 3QR>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Preseli
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C43+ BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C40+ BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 626167000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C42- SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 641833000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C40+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 626167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Redruth b/dvb-t/uk-Redruth
> index d38781b..488b5b8 100644
> --- a/dvb-t/uk-Redruth
> +++ b/dvb-t/uk-Redruth
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/TR16 6QZ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TR16 6QZ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Redruth
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C44+ BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C47 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 682000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C48 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 690000000
> @@ -42,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C52 ARQ A]
> +[C33 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 722000000
> +       FREQUENCY = 570000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C51 ARQ B]
> +[C32 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 714000000
> +       FREQUENCY = 562000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C47 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 682000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Reigate b/dvb-t/uk-Reigate
> index 87cde86..24a38fc 100644
> --- a/dvb-t/uk-Reigate
> +++ b/dvb-t/uk-Reigate
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/RH2 9RN/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/RH2 9RN>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Reigate
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C23 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C30- BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 545833000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C21+ SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 474167000
> @@ -66,16 +79,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C30- BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 545833000
> +[C35 L-LON]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QPSK
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-RidgeHill b/dvb-t/uk-RidgeHill
> index ba47fda..100acdc 100644
> --- a/dvb-t/uk-RidgeHill
> +++ b/dvb-t/uk-RidgeHill
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/HR8 2PG/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/HR8 2PG>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Ridge Hill
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C28 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C22+ BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 482167000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C22+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 482167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Rosemarkie b/dvb-t/uk-Rosemarkie
> index 7770522..6034438 100644
> --- a/dvb-t/uk-Rosemarkie
> +++ b/dvb-t/uk-Rosemarkie
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/IV11 8XY/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/IV11 8XY>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Rosemarkie
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C45 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C42 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 642000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C43 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 650000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C42 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 642000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Rosneath b/dvb-t/uk-Rosneath
> index 31db889..deb1c6a 100644
> --- a/dvb-t/uk-Rosneath
> +++ b/dvb-t/uk-Rosneath
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/G84 0LF/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/G84 0LF>
>  #----------------------------------------------------------------------------------------------
> -# location and provider: UK, Rosneath
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# location and provider: UK, Rosneath VP
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C49 BBC A]
> +[C39 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 698000000
> +       FREQUENCY = 618000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C58 D3&4]
> +[C42 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 770000000
> +       FREQUENCY = 642000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C53 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 730000000
> +[C45 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 666000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C57 ARQ A]
> +[C33 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 762000000
> +       FREQUENCY = 570000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C60- ARQ B]
> +[C36 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 785833000
> +       FREQUENCY = 594000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +67,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C54 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 738000000
> +[C48 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 690000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-Rowridge b/dvb-t/uk-Rowridge
> index 207cae6..a4ea3b7 100644
> --- a/dvb-t/uk-Rowridge
> +++ b/dvb-t/uk-Rowridge
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/PO30 4HT/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/PO30 4HT>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Rowridge
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C24 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C21+ BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 474167000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 474167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-RumsterForest b/dvb-t/uk-RumsterForest
> index cbfd5b3..39c897c 100644
> --- a/dvb-t/uk-RumsterForest
> +++ b/dvb-t/uk-RumsterForest
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/KW5 6DJ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/KW5 6DJ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Rumster Forest
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C27 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C21+ BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 474167000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C32 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 562000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 474167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Saddleworth b/dvb-t/uk-Saddleworth
> index 32a118d..f1c9ec2 100644
> --- a/dvb-t/uk-Saddleworth
> +++ b/dvb-t/uk-Saddleworth
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/OL3 5RU/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/OL3 5RU>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Saddleworth
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C45 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C42 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 642000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C51- SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 713833000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C42 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 642000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Salisbury b/dvb-t/uk-Salisbury
> index ec1f74a..9533a8c 100644
> --- a/dvb-t/uk-Salisbury
> +++ b/dvb-t/uk-Salisbury
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/SP2 8NZ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SP2 8NZ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Salisbury
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C41 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C47 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 682000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C29 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 538000000
> @@ -66,19 +79,6 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C47 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 682000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
>  [C23 L-SBY]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 490000000
> diff --git a/dvb-t/uk-SandyHeath b/dvb-t/uk-SandyHeath
> index dc96860..25f100b 100644
> --- a/dvb-t/uk-SandyHeath
> +++ b/dvb-t/uk-SandyHeath
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/SG19 2NH/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SG19 2NH>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Sandy Heath
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C27 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C21+ BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 474167000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -43,9 +43,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C51 SDN]
> +[C33 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 714000000
> +       FREQUENCY = 570000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 474167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Selkirk b/dvb-t/uk-Selkirk
> index 13ad81c..f8bbd3d 100644
> --- a/dvb-t/uk-Selkirk
> +++ b/dvb-t/uk-Selkirk
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/TD7 4QN/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TD7 4QN>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Selkirk
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C32 BBC A]
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C59- D3&4]
> +[C34 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 777833000
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,21 +30,22 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C57 SDN]
> -       DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 762000000
> +[C35 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 3/4
> +       CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/64
> -       TRANSMISSION_MODE = 8K
> -       GUARD_INTERVAL = 1/32
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
>         HIERARCHY = NONE
> +       STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C53 ARQ A]
> +[C33 SDN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 730000000
> +       FREQUENCY = 570000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -54,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C60- ARQ B]
> +[C36 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 785833000
> +       FREQUENCY = 594000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,16 +67,15 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +[C48 ARQ B]
> +       DELIVERY_SYSTEM = DVBT
> +       FREQUENCY = 690000000
>         BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> +       CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> +       MODULATION = QAM/64
> +       TRANSMISSION_MODE = 8K
> +       GUARD_INTERVAL = 1/32
>         HIERARCHY = NONE
> -       STREAM_ID = 0
>         INVERSION = AUTO
>
> diff --git a/dvb-t/uk-Sheffield b/dvb-t/uk-Sheffield
> index 9716def..1fa66b2 100644
> --- a/dvb-t/uk-Sheffield
> +++ b/dvb-t/uk-Sheffield
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/S10 5GL/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/S10 5GL>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Sheffield
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C27 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C31 COM7 HD]
> +[C21+ BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 554000000
> +       FREQUENCY = 474167000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,35 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C21+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 474167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C37 COM8 HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 602000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C55 L-SFD]
> +[C35 L-SFD]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 746000000
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-StocklandHill b/dvb-t/uk-StocklandHill
> index f15314a..05f2b7a 100644
> --- a/dvb-t/uk-StocklandHill
> +++ b/dvb-t/uk-StocklandHill
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/EX14 9EP/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/EX14 9EP>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Stockland Hill
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C26+ BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C29+ BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 538167000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C25- SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 505833000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C29+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 538167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Storeton b/dvb-t/uk-Storeton
> index 110844b..5d51e4e 100644
> --- a/dvb-t/uk-Storeton
> +++ b/dvb-t/uk-Storeton
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/CH63 2RH/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CH63 2RH>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Storeton
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C28 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C22 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 482000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C23 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 490000000
> @@ -66,19 +79,6 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C22 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 482000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
>  [C30 L-LIV]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 546000000
> diff --git a/dvb-t/uk-Sudbury b/dvb-t/uk-Sudbury
> index fe9adfd..1c655bf 100644
> --- a/dvb-t/uk-Sudbury
> +++ b/dvb-t/uk-Sudbury
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/CO10 5NG/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CO10 5NG>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Sudbury
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C44 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C47 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 682000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C29 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 538000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C47 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 682000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-SuttonColdfield b/dvb-t/uk-SuttonColdfield
> index 1d409bc..9542eab 100644
> --- a/dvb-t/uk-SuttonColdfield
> +++ b/dvb-t/uk-SuttonColdfield
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/B75 5JJ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/B75 5JJ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Sutton Coldfield
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C43 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C40+ BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 626167000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C40+ BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 626167000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Tacolneston b/dvb-t/uk-Tacolneston
> index bde168a..95f8611 100644
> --- a/dvb-t/uk-Tacolneston
> +++ b/dvb-t/uk-Tacolneston
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/NR16 1DW/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/NR16 1DW>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Tacolneston
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C40 BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C46 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 674000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C46 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 674000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-TheWrekin b/dvb-t/uk-TheWrekin
> index 2a6c7e4..1ec3aba 100644
> --- a/dvb-t/uk-TheWrekin
> +++ b/dvb-t/uk-TheWrekin
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/TF6 5AL/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TF6 5AL>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, The Wrekin
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C26 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C30- BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 545833000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C41+ SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 634167000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C30- BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 545833000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-Torosay b/dvb-t/uk-Torosay
> index a2e9dea..5f25f34 100644
> --- a/dvb-t/uk-Torosay
> +++ b/dvb-t/uk-Torosay
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/PA65 6AZ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/PA65 6AZ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Torosay
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C28 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C22 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 482000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C23 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 490000000
> @@ -66,16 +79,3 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C22 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 482000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> diff --git a/dvb-t/uk-TunbridgeWells b/dvb-t/uk-TunbridgeWells
> index e8a3ef0..15da6c4 100644
> --- a/dvb-t/uk-TunbridgeWells
> +++ b/dvb-t/uk-TunbridgeWells
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/TN11 0NB/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TN11 0NB>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Tunbridge Wells
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C41 BBC A]
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C47 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 682000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C29 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 538000000
> @@ -66,19 +79,6 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C47 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 682000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
>  [C39 L-MDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 618000000
> diff --git a/dvb-t/uk-Waltham b/dvb-t/uk-Waltham
> index cd2aeff..f20900a 100644
> --- a/dvb-t/uk-Waltham
> +++ b/dvb-t/uk-Waltham
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/LE14 4AJ/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/LE14 4AJ>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Waltham
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C49 BBC A]
> +[C32 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 698000000
> +       FREQUENCY = 562000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C54- D3&4]
> +[C34 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 737833000
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C31 COM7 HD]
> +[C35 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 554000000
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -67,9 +67,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C57 ARQ B]
> +[C31 ARQ B]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 762000000
> +       FREQUENCY = 554000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C58 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 770000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C56 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 754000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -105,9 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C26 L-NOT]
> +[C41 L-NOT]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 514000000
> +       FREQUENCY = 634000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-Wenvoe b/dvb-t/uk-Wenvoe
> index 8984db3..3e40095 100644
> --- a/dvb-t/uk-Wenvoe
> +++ b/dvb-t/uk-Wenvoe
> @@ -1,9 +1,9 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/CF5 6SA/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CF5 6SA>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Wenvoe
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
>  [C41+ BBC A]
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C31 COM7 HD]
> +[C47 BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 554000000
> +       FREQUENCY = 682000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,9 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C47 BBC B HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 682000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -92,22 +92,9 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C37 COM8 HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 602000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C51 L-CDF]
> +[C37 L-CDF]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 714000000
> +       FREQUENCY = 602000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-WhitehawkHill b/dvb-t/uk-WhitehawkHill
> index c771308..484baef 100644
> --- a/dvb-t/uk-WhitehawkHill
> +++ b/dvb-t/uk-WhitehawkHill
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/BN2 5EL/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BN2 5EL>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Whitehawk Hill
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C60- BBC A]
> +[C48 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 785833000
> +       FREQUENCY = 690000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -18,9 +18,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C53 D3&4]
> +[C35 D3&4]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 730000000
> +       FREQUENCY = 586000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,6 +30,19 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> +[C36 BBC B HD]
> +       DELIVERY_SYSTEM = DVBT2
> +       FREQUENCY = 594000000
> +       BANDWIDTH_HZ = 8000000
> +       CODE_RATE_HP = 2/3
> +       CODE_RATE_LP = NONE
> +       MODULATION = QAM/256
> +       TRANSMISSION_MODE = 32K
> +       GUARD_INTERVAL = 1/128
> +       HIERARCHY = NONE
> +       STREAM_ID = 0
> +       INVERSION = AUTO
> +
>  [C32 SDN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 562000000
> @@ -42,9 +55,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C57 ARQ A]
> +[C34 ARQ A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 762000000
> +       FREQUENCY = 578000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> @@ -66,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C51 BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 714000000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C54 L-BTN]
> +[C40 L-BTN]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 738000000
> +       FREQUENCY = 626000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 3/4
>         CODE_RATE_LP = NONE
> diff --git a/dvb-t/uk-WinterHill b/dvb-t/uk-WinterHill
> index e5446dc..97895b5 100644
> --- a/dvb-t/uk-WinterHill
> +++ b/dvb-t/uk-WinterHill
> @@ -1,14 +1,14 @@
>  #----------------------------------------------------------------------------------------------
>  # Auto-generated from:
> -# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/BL6 6SL/NA/0/>
> +# <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BL6 6SL>
>  #----------------------------------------------------------------------------------------------
>  # location and provider: UK, Winter Hill
> -# date (yyyy-mm-dd)    : 2018-08-30
> +# date (yyyy-mm-dd)    : 2020-07-10
>  #
>  #----------------------------------------------------------------------------------------------
> -[C50 BBC A]
> +[C32 BBC A]
>         DELIVERY_SYSTEM = DVBT
> -       FREQUENCY = 706000000
> +       FREQUENCY = 562000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -30,9 +30,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C55 COM7 HD]
> +[C54- BBC B HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 746000000
> +       FREQUENCY = 737833000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -79,22 +79,9 @@
>         HIERARCHY = NONE
>         INVERSION = AUTO
>
> -[C54- BBC B HD]
> -       DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 737833000
> -       BANDWIDTH_HZ = 8000000
> -       CODE_RATE_HP = 2/3
> -       CODE_RATE_LP = NONE
> -       MODULATION = QAM/256
> -       TRANSMISSION_MODE = 32K
> -       GUARD_INTERVAL = 1/128
> -       HIERARCHY = NONE
> -       STREAM_ID = 0
> -       INVERSION = AUTO
> -
> -[C31 COM8 HD]
> +[C55 COM7 HD]
>         DELIVERY_SYSTEM = DVBT2
> -       FREQUENCY = 554000000
> +       FREQUENCY = 746000000
>         BANDWIDTH_HZ = 8000000
>         CODE_RATE_HP = 2/3
>         CODE_RATE_LP = NONE
> @@ -105,7 +92,7 @@
>         STREAM_ID = 0
>         INVERSION = AUTO
>
> -[C40 L-MAN / L-LIV / L-PTN]
> +[C40 L-PTN]
>         DELIVERY_SYSTEM = DVBT
>         FREQUENCY = 626000000
>         BANDWIDTH_HZ = 8000000
> --
> 2.7.4
>
