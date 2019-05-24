Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66D682952A
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 11:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390046AbfEXJyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 05:54:25 -0400
Received: from gofer.mess.org ([88.97.38.141]:49439 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389582AbfEXJyZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 05:54:25 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 77E3F60608; Fri, 24 May 2019 10:54:23 +0100 (BST)
Date:   Fri, 24 May 2019 10:54:23 +0100
From:   Sean Young <sean@mess.org>
To:     =?iso-8859-1?Q?Fr=E9d=E9ric?= Deghetto 
        <frederic.deghetto@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: rc rc0: two consecutive events of type space & strange
 ir-keytable behaviour
Message-ID: <20190524095423.55iprvv6ocp5fwu2@gofer.mess.org>
References: <ff3cbf92-3f43-2a85-68d3-35f9086aa393@gmail.com>
 <63e2ee50-6ba0-c231-2062-ad892b037bac@gmail.com>
 <20190524074043.2c7zns4urhkxran6@gofer.mess.org>
 <CACRW-tjVokBnZNNVPKH64Cu19Xe3Xd+abZfVODegpOxiORwhMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRW-tjVokBnZNNVPKH64Cu19Xe3Xd+abZfVODegpOxiORwhMw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 24, 2019 at 11:45:25AM +0200, Frédéric Deghetto wrote:
> Hi Sean,
> 
> Here are the outputs:
> ir-keytable:
> Found /sys/class/rc/rc0/ (/dev/input/event1) with:
>         Driver gpio_ir_recv, table rc-rc6-mce
>         Supported protocols: other lirc rc-5 rc-5-sz jvc sony nec sanyo
> mce_kbd rc-6 sharp xmp
>         Enabled protocols: lirc rc-6
>         Name: gpio_ir_recv
>         bus: 25, vendor/product: 0001:0001, version: 0x0100
>         Repeat delay = 500 ms, repeat period = 125 ms
> 
> 
> 
> cat  /etc_rc_maps.cfg:
> #
> # Keymaps table
> #
> # This table creates an association between a keycode file and a kernel
> # driver. It can be used to automatically override a keycode definition.
> #
> # Although not yet tested, it is mented to be added at udev.
> #
> # To use, you just need to run:
> #       ./ir-keytable -a
> #
> # Or, if the remote is not the first device:
> #       ./ir-keytable -a -s rc1         # for RC at rc1
> #
> 
> # Format:
> #       driver - name of the driver provided via uevent - use * for any
> driver
> #       table -  RC keymap table, provided via uevent - use * for any table
> #       file - file name. If directory is not specified, it will default to
> #               /etc/rc_keymaps.
> # For example:
> # driver        table                           file
> # cx8800        *                               ./keycodes/rc5_hauppauge_new
> # *             rc-avermedia-m135a-rm-jx        ./keycodes/kworld_315u
> # saa7134       rc-avermedia-m135a-rm-jx
>  ./keycodes/keycodes/nec_terratec_cinergy_xs
> # em28xx        *                               ./keycodes/kworld_315u
> # *             *                               ./keycodes/rc5_hauppauge_new
> 
> # Table to automatically load the rc maps for the bundled IR's provided
> with the
> # devices supported by the linux kernel
> 
> #driver table                    file
> *       rc-adstech-dvb-t-pci     adstech_dvb_t_pci
> *       rc-alink-dtu-m           alink_dtu_m
> *       rc-anysee                anysee
> *       rc-apac-viewcomp         apac_viewcomp
> *       rc-asus-pc39             asus_pc39
> *       rc-asus-ps3-100          asus_ps3_100
> *       rc-ati-tv-wonder-hd-600  ati_tv_wonder_hd_600
> *       rc-ati-x10               ati_x10
> *       rc-avermedia-a16d        avermedia_a16d
> *       rc-avermedia-cardbus     avermedia_cardbus
> *       rc-avermedia-dvbt        avermedia_dvbt
> *       rc-avermedia-m135a       avermedia_m135a
> *       rc-avermedia-m733a-rm-k6 avermedia_m733a_rm_k6
> *       rc-avermedia-rm-ks       avermedia_rm_ks
> *       rc-avermedia             avermedia
> *       rc-avertv-303            avertv_303
> *       rc-azurewave-ad-tu700    azurewave_ad_tu700
> *       rc-behold-columbus       behold_columbus
> *       rc-behold                behold
> *       rc-budget-ci-old         budget_ci_old
> *       rc-cec                   cec
> *       rc-cinergy-1400          cinergy_1400
> *       rc-cinergy               cinergy
> *       rc-delock-61959          delock_61959
> *       rc-dib0700-nec           dib0700_nec
> *       rc-dib0700-rc5           dib0700_rc5
> *       rc-digitalnow-tinytwin   digitalnow_tinytwin
> *       rc-digittrade            digittrade
> *       rc-dm1105-nec            dm1105_nec
> *       rc-dntv-live-dvb-t       dntv_live_dvb_t
> *       rc-dntv-live-dvbt-pro    dntv_live_dvbt_pro
> *       rc-dtt200u               dtt200u
> *       rc-dvbsky                dvbsky
> *       rc-em-terratec           em_terratec
> *       rc-encore-enltv-fm53     encore_enltv_fm53
> *       rc-encore-enltv          encore_enltv
> *       rc-encore-enltv2         encore_enltv2
> *       rc-evga-indtube          evga_indtube
> *       rc-eztv                  eztv
> *       rc-flydvb                flydvb
> *       rc-flyvideo              flyvideo
> *       rc-fusionhdtv-mce        fusionhdtv_mce
> *       rc-gadmei-rm008z         gadmei_rm008z
> *       rc-genius-tvgo-a11mce    genius_tvgo_a11mce
> *       rc-gotview7135           gotview7135
> *       rc-hauppauge             hauppauge
> *       rc-imon-mce              imon_mce
> *       rc-imon-pad              imon_pad
> *       rc-iodata-bctv7e         iodata_bctv7e
> *       rc-it913x-v1             it913x_v1
> *       rc-it913x-v2             it913x_v2
> *       rc-kaiomy                kaiomy
> *       rc-kworld-315u           kworld_315u
> *       rc-kworld-pc150u         kworld_pc150u
> *       rc-kworld-plus-tv-analog kworld_plus_tv_analog
> *       rc-leadtek-y04g0051      leadtek_y04g0051
> *       rc-lme2510               lme2510
> *       rc-manli                 manli
> *       rc-medion-x10-digitainer medion_x10_digitainer
> *       rc-medion-x10-or2x       medion_x10_or2x
> *       rc-medion-x10            medion_x10
> *       rc-msi-digivox-ii        msi_digivox_ii
> *       rc-msi-digivox-iii       msi_digivox_iii
> *       rc-msi-tvanywhere-plus   msi_tvanywhere_plus
> *       rc-msi-tvanywhere        msi_tvanywhere
> *       rc-nebula                nebula
> *       rc-nec-terratec-cinergy-xs nec_terratec_cinergy_xs
> *       rc-norwood               norwood
> *       rc-npgtech               npgtech
> *       rc-pctv-sedna            pctv_sedna
> *       rc-pinnacle-color        pinnacle_color
> *       rc-pinnacle-grey         pinnacle_grey
> *       rc-pinnacle-pctv-hd      pinnacle_pctv_hd
> *       rc-pixelview-002t        pixelview_002t
> *       rc-pixelview-mk12        pixelview_mk12
> *       rc-pixelview-new         pixelview_new
> *       rc-pixelview             pixelview
> *       rc-powercolor-real-angel powercolor_real_angel
> *       rc-proteus-2309          proteus_2309
> *       rc-purpletv              purpletv
> *       rc-pv951                 pv951
> #*      rc-rc6-mce               rc6_mce
> gpio-rc-recv    rc-rc6-mce      kodi

That's different than gpio_ir_recv

> *       rc-real-audio-220-32-keys real_audio_220_32_keys
> *       rc-reddo                 reddo
> *       rc-snapstream-firefly    snapstream_firefly
> *       rc-streamzap             streamzap
> *       rc-su3000                su3000
> *       rc-tbs-nec               tbs_nec
> *       rc-technisat-ts35        technisat_ts35
> *       rc-technisat-usb2        technisat_usb2
> *       rc-terratec-cinergy-c-pci terratec_cinergy_c_pci
> *       rc-terratec-cinergy-s2-hd terratec_cinergy_s2_hd
> *       rc-terratec-cinergy-xs   terratec_cinergy_xs
> *       rc-terratec-slim-2       terratec_slim_2
> *       rc-terratec-slim         terratec_slim
> *       rc-tevii-nec             tevii_nec
> *       rc-tivo                  tivo
> *       rc-total-media-in-hand-02 total_media_in_hand_02
> *       rc-total-media-in-hand   total_media_in_hand
> *       rc-trekstor              trekstor
> *       rc-tt-1500               tt_1500
> *       rc-twinhan-dtv-cab-ci    twinhan_dtv_cab_ci
> *       rc-twinhan1027           twinhan_vp1027_dvbs
> *       rc-videomate-k100        videomate_k100
> *       rc-videomate-s350        videomate_s350
> *       rc-videomate-tv-pvr      videomate_tv_pvr
> *       rc-winfast-usbii-deluxe  winfast_usbii_deluxe
> *       rc-winfast               winfast
> # *     *                        a800                 # found in a800.c
> # *     *                        af9005               # found in
> af9005-remote.c
> # *     *                        cinergyt2            # found in
> cinergyT2-core.c
> # *     *                        dvico_mce            # found in cxusb.c
> # *     *                        dvico_portable       # found in cxusb.c
> # *     *                        d680_dmb             # found in cxusb.c
> # *     *                        dibusb               # found in
> dibusb-common.c
> # *     *                        digitv               # found in digitv.c
> # *     *                        megasky              # found in m920x.c
> # *     *                        tvwalkertwin         # found in m920x.c
> # *     *                        pinnacle310e         # found in m920x.c
> # *     *                        haupp                # found in
> nova-t-usb2.c
> # *     *                        opera1               # found in opera1.c
> # *     *                        vp702x               # found in vp702x.c
> # *     *                        vp7045               # found in vp7045.c
> 
> 
> 
> ir-keytable --version :
> IR keytable control version 1.12.3
> 
> 
> 
> Something strange:
> This command "sudo ir-keytable -p nec -w /etc/rc_keymaps/kodi" gives the
> expect output, where the sudo ir-keytable -a /etc/rc_maps.cfg doesn't load
> the table.

The driver name does not match (see above).

> output from ""sudo ir-keytable -p nec -w /etc/rc_keymaps/kodi"
> Read kodi table
> Wrote 27 keycode(s) to driver
> Protocols changed to nec
> 
> I am not at home. I will test the result of the command "sudo ir-keytable
> -p nec -w /etc/rc_keymaps/kodi" this evening.

That would be great, thanks.


Sean
